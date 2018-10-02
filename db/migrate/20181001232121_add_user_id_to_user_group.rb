class AddUserIdToUserGroup < ActiveRecord::Migration[5.2]
  def change
    add_column :user_groups, :user_id, :Integer
  end
end
