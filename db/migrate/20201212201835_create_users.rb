class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email, limit: 100
      t.string :name, limit: 50
      t.string :password_digest
      t.string :session_token

      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :session_token
  end
end
