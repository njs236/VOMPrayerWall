class Resource < ApplicationRecord
  belongs_to :request
  belongs_to :user
  validates :name, presence:true
end
