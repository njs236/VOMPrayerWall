class Invitation < ApplicationRecord
  has_secure_token
  belongs_to :user_group
  belongs_to :from, :class_name => "User", :primary_key => "from"
  belongs_to :recipient, :class_name => "User", :primary_key => "to"
  validates :from, :to, presence: true
  
end
