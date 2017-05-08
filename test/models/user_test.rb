require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "First name, last name, DOB and username should not be empty" do
    user = User.new
    assert user.invalid?
    assert user.errors[:first_name].any?
    assert user.errors[:last_name].any?
    assert user.errors[:date_of_birth].any?
    assert user.errors[:username].any?
  end




  test "Password must be valid" do
    user = User.new(
      email: 'test@example.com',
      password: 'password',
      password_confirmation: 'password'
    )
    assert(user.valid_password?('password'))
  end



end
