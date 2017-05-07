require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "First name, last name and DOB should not be empty" do
    user = User.new
    assert user.invalid?
    assert user.errors[:first_name].any?
    assert user.errors[:last_name].any?
    assert user.errors[:date_of_birth].any?
  end
end
