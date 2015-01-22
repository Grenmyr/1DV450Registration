require 'test_helper'

class ApiTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'should save with user_id' do
    user = User.new

    api = Api.new
    api.user = user


    # kollar att det verkligen är true (assert)
    assert api.save
  end

  test 'should save with api' do
    user = User.new
    user.username = 'Testuser'
    user.password = '123456'
    api = Api.new
    user.api = api


    assert user.save, 'd'
  end
end
