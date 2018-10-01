class User < ApplicationRecord
  has_secure_password
  has_many :requests
  has_many :resources
end
