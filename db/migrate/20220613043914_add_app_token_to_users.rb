class AddAppTokenToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :app_token, :string
  end
end
