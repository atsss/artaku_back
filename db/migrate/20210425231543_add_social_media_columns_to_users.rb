class AddSocialMediaColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :linkedin_url, :string, after: :description
    add_column :users, :github_url, :string, after: :linkedin_url
    add_column :users, :twitter_url, :string, after: :github_url
    add_column :users, :facebook_url, :string, after: :twitter_url
    add_column :users, :instagram_url, :string, after: :facebook_url
  end
end
