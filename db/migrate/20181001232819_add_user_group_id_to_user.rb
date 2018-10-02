class AddUserGroupIdToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :usergroup_id, :Integer
  end
end
