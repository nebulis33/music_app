class CreateAlbums < ActiveRecord::Migration[6.0]
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.integer :year, limit: 4, null: false
      t.string :recording_type, null: false, default: "studio"
      t.belongs_to :band

      t.timestamps
    end
  end
end
