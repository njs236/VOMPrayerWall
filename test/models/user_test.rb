require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "has a request association" do
    assert_equal 3, users(:nathan).requests.size
    assert users(:nathan).requests.includes requests(:one)
  end
  test "has a resource association" do
    assert_equal 1, users(:nathan).resources.size
    assert users(:john).resources.includes resources(:two)
  end
  test "is associated with a user" do
    assert_equal users(:nathan), requests(:one).user
  end
  
  test "is associated with a resource" do
    assert_equal users(:nathan), resources(:one).user
  end

end
