class CreateWorkProcesses < ActiveRecord::Migration[6.1]
  def change
    create_table :work_processes do |t|
      t.references :artwork, null: false, foreign_key: false
      t.text :description
      t.string :video_url
      t.datetime :done_at, null: false
      t.datetime :deleted_at

      t.timestamps
    end

    add_index :work_processes, :deleted_at
  end
end
