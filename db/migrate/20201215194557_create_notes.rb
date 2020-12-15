class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.belongs_to :user
      t.belongs_to :track
      t.text :body, null: false

      t.timestamps
    end
  end
end
