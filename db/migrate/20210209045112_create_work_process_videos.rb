class CreateWorkProcessVideos < ActiveRecord::Migration[6.1]
  def change
    create_table :work_process_videos do |t|
      t.references :work_process, null: false, foreign_key: false
      t.string :title
      t.string :url, null: false
      t.datetime :deleted_at

      t.timestamps
    end

    add_index :work_process_videos, :deleted_at
  end
end
