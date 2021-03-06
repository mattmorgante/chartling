require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup 
    @user = User.new(name: "matt", email: "matt@test.com")
  end 

  test "should be valid" do 
    assert @user.valid? 
  end 

  test "name should be present" do 
    @user.name = "   "
    assert_not @user.valid? 
  end 

  test "name should not be too long" do 
    @user.name = "a" * 51 
    assert_not @user.valid?
  end 

  test "email should not be too long" do 
    @user.email = "a" * 251 + "@test.com"
    assert_not @user.valid? 
  end 

  test "email validation should accept valid addresses" do 
    valid_addresses = %w[user@example.com]
    valid_addresses.each do |valid_email|
      @user.email = valid_email
      # custom error which identifies unique address causing failure
      assert @user.valid?, "#{valid_email.inspect} should be valid"
    end 
  end 

  test "email validation should reject invalid addresses" do 
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. 
                          foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_email| 
      @user.email = invalid_email
      assert_not @user.valid?, "#{invalid_email.inspect} should be invalid" 
    end 
  end 

  test "email addresses should be unique" do 
    duplicate_user = @user.dup 
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid? 
  end 
  # test "the truth" do
  #   assert true
  # end
end
