class AddAuthenticationTokenToSubscribers < ActiveRecord::Migration[6.0]
  def change
    add_column :subscribers, :authentication_token, :string, limit: 30
    add_index :subscribers, :authentication_token, unique: true
  end
end
