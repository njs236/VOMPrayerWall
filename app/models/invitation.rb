class Invitation < ApplicationRecord
  belongs_to :user
  validates :from, :to, :token, presence: true
  
end
