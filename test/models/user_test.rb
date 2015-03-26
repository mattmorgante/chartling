require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup 
    @user = User.new(name: "matt", email: "matt@test.com")
  end 

  test "should be valid" do 
    assert @user.valid? 
  end 
  # test "the truth" do
  #   assert true
  # end
end
