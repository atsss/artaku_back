class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.references :user, null: false, foreign_key: false
      t.string :title, null: false
      t.string :description
      t.string :url, null: false
      t.datetime :published_at
      t.datetime :deleted_at

      t.timestamps
    end

    add_index :articles, :deleted_at
  end
end
