class AddUserIdToInvitationAndSubscriber < ActiveRecord::Migration[5.2]
  def change
    add_column :invitations, :user_id, :Integer
    add_column :subscribers, :user_id, :Integer
  end
end
