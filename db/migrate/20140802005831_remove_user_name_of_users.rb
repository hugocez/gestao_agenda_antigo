class RemoveUserNameOfUsers < ActiveRecord::Migration
  def change
    remove_index :users, :user_name
  end
end
