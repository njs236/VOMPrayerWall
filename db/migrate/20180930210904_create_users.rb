class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :password_digest
      t.string :name
      t.string :email

      t.timestamps
    end
    add_column :requests, :user_id, :integer
    add_column :resources, :request_id, :integer
    add_column :resources, :user_id, :integer
  end
end
