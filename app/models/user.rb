class User < ApplicationRecord
  has_secure_password
  has_secure_token
  has_many :requests
  has_many :resources
  has_many :subscribers
  has_many :invitations
  
  def to_param
    "#{name.gsub(/\W/, '')}"
  end
end
