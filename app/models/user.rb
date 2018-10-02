class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_secure_token
  has_many :requests
  has_many :resources
  has_many :subscribers
  has_one :usergroup
  has_many :invitations, :class_name => "Invitation", :foreign_key => "to"
  has_many :sent_invitations, :class_name => "Invitation", :foreign_key => "from" 
  
  def to_param
    "#{name.gsub(/\W/, '')}"
  end
end
