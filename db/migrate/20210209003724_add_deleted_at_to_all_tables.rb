class AddDeletedAtToAllTables < ActiveRecord::Migration[6.1]
  def change
    add_column :artworks, :deleted_at, :datetime, after: :updated_at
    add_column :shootings, :deleted_at, :datetime, after: :updated_at
    add_column :users, :deleted_at, :datetime, after: :updated_at
    add_index :artworks, :deleted_at
    add_index :shootings, :deleted_at
    add_index :users, :deleted_at
  end
end
