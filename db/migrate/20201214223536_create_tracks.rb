class CreateTracks < ActiveRecord::Migration[6.0]
  def change
    create_table :tracks do |t|
      t.string :title, null: false
      t.integer :ord, null: false
      t.integer :album_id, null: false
      t.text :lyrics
      t.boolean :regular, default: true

      t.timestamps
    end
    add_index :tracks, [:album_id, :ord], unique: true
    add_index :tracks, [:album_id, :title], unique: true
  end
end
