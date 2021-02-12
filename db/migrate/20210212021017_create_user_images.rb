class CreateUserImages < ActiveRecord::Migration[6.1]
  def change
    create_table :user_images do |t|
      t.references :user, null: false, foreign_key: false
      t.string :title
      t.datetime :deleted_at

      t.timestamps
    end

    add_index :user_images, :deleted_at
  end
end
