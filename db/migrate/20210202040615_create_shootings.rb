class CreateShootings < ActiveRecord::Migration[6.1]
  def change
    create_table :shootings do |t|
      t.references :author, foreign_key: false, null: false
      t.datetime :conducted_at, null: false
      t.string :zip
      t.string :state
      t.string :city
      t.string :address, null: false
      t.text :description

      t.timestamps
    end
  end
end
