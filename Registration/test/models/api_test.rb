require 'test_helper'

class ApiTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end



  test 'should save with user_id' do
    api2 = Api.new
    api2.user_id = 5


    # kollar att det verkligen är true (assert)
    assert api2.save
  end
end
