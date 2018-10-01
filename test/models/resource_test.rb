require 'test_helper'

class ResourceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "Resource is not valid without name" do
    r = Resource.create(name:nil)
    assert r.errors[:name].any?
    refute r.valid?
  end
  #found this to be the best way to handle attributes on resource in creating resources. 
  test "Resource contains valid attributes" do
    resource = Resource.create(request: requests(:one),
    user: users(:nathan),
    name:"prayer_notes_NathanSinclair_1.doc")
    assert resource.valid?
  end
  

  
end
