class CreateArtworkImages < ActiveRecord::Migration[6.1]
  def change
    create_table :artwork_images do |t|
      t.references :artwork, null: false, foreign_key: false
      t.string :title
      t.datetime :deleted_at

      t.timestamps
    end

    add_index :artwork_images, :deleted_at
  end
end
