class CreateWalls < ActiveRecord::Migration[6.1]
  def change
    create_table :walls do |t|
      t.string :name, null: false
      t.string :content_url
      t.text :comment
      t.datetime :deleted_at

      t.timestamps
    end

    add_index :walls, :deleted_at
  end
end
