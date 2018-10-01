ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  
  def login_user
    post session_path, params: { email: users(:nathan).email, password: 'password'}
  end
  
  def logout_user
    delete session_path
  end
end
