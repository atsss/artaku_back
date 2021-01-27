class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :slug, null: false
      t.string :name, null: false
      t.text :description

      t.timestamps
    end

    add_index :users, :slug, unique: true
  end
end
