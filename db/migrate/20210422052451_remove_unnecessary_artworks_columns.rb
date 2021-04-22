class RemoveUnnecessaryArtworksColumns < ActiveRecord::Migration[6.1]
  def change
    remove_column :artworks, :published_at, :datetime, after: :sold_at
    remove_column :artworks, :sold_at, :datetime, after: :completed_at
    remove_column :artworks, :depth, :float, after: :height
    remove_column :artworks, :height, :float, null: false, after: :width
    remove_column :artworks, :width, :float, null: false, after: :material
    remove_column :artworks, :material, :string, null: false, after: :style
    remove_column :artworks, :style, :string, null: false, after: :price
    remove_column :artworks, :price, :integer, after: :description

    drop_table :shootings
  end
end
