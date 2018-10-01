require 'test_helper'

class RequestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "Request is not valid without description" do
    r = Request.create(title: 'Pastor on trial', description: nil)
    assert r.errors[:description].any?
    refute r.valid?
  end

  test "Request is valid with required attributes" do
    r = users(:nathan).requests.create(title: 'Pastor on trial',
        description: 'Please pray for Pastor who is on trial for speaking about Jesus')
    assert r.valid?
  end
  


end
