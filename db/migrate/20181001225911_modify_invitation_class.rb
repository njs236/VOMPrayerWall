class ModifyInvitationClass < ActiveRecord::Migration[5.2]
  def change
    
    remove_column :invitations, :from
    remove_column :invitations, :to
    add_column :invitations, :from, :Integer
    add_column :invitations, :to, :Integer
    add_column :invitations, :email, :string
    add_column :invitations, :user_group_id, :Integer
  end
end
