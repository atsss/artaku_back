class CreateReferences < ActiveRecord::Migration[6.1]
  def change
    create_table :references do |t|
      t.references :artwork, null: false, foreign_key: false
      t.string :kind
      t.string :url, null: false
      t.text :description
      t.datetime :deleted_at

      t.timestamps
    end

    add_index :references, :deleted_at
  end
end
