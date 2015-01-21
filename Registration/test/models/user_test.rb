require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'should save with username' do
    user = User.new
    user.username = 'Testuser'
    user.password = '123456'

    # kollar att det verkligen är true (assert)
    assert user.save
  end

  test 'should not save without username' do
    user = User.new


    # kollar att det verkligen är false (assert_not)
    assert_not user.save
  end

end
