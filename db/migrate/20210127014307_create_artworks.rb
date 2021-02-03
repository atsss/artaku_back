class CreateArtworks < ActiveRecord::Migration[6.1]
  def change
    create_table :artworks do |t|
      t.references :author, foreign_key: false, null: false
      t.string :title, null: false
      t.text :description
      t.integer :price
      t.string :style, null: false
      t.string :material, null: false
      t.float :width, null: false
      t.float :height, null: false
      t.float :depth
      t.datetime :completed_at
      t.datetime :sold_at
      t.datetime :published_at

      t.timestamps
    end
  end
end
