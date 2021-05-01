class AddMediumColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :medium_url, :string, after: :instagram_url
  end
end
