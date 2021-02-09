class CreateWorkProcessImages < ActiveRecord::Migration[6.1]
  def change
    create_table :work_process_images do |t|
      t.references :work_process, null: false, foreign_key: false
      t.string :title
      t.datetime :deleted_at

      t.timestamps
    end

    add_index :work_process_images, :deleted_at
  end
end
