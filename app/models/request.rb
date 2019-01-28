class Request < ApplicationRecord
  validates :title, :description, presence: true
  belongs_to :user
  has_many :resources
  accepts_nested_attributes_for :resources
  
  scope :user_requests, -> { where("id > 0").order("id DESC") }
  
  def hasananswerfromuser(user)
      return :answer
  end
end
