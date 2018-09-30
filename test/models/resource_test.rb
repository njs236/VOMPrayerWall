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
  
  test "Resource contains valid attributes" do
    r = Resource.create(name:"prayer_notes_NathanSinclair_1.doc")
    assert r.valid?
  end
  
end
