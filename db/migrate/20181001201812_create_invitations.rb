class CreateInvitations < ActiveRecord::Migration[5.2]
  def change
    create_table :invitations do |t|
      t.string :from #the inviter eamil
      t.string :to #the subscriber email
      t.string :token #randomly generated token from ActiveRecord secure token implementation.
    
      t.timestamps
    end
    
    add_column :users, :token, :string, default: "" #for further use of system. it is the inviter who
    #authorizes the token. 
  end
end
