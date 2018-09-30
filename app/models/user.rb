class User < ApplicationRecord
  has_secure_password
  has_many :request
  has_many :resource
end
