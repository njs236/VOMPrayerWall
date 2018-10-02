class UserGroup < ApplicationRecord
  belongs_to :user
  has_many :invitations
end
