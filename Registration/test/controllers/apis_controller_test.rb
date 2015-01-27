require 'test_helper'

class ApisControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'Should get /users/1/apis' do
    assert_routing 'users/1/apis', {controller: 'users',action: 'index', user_id: 1}
    get :index,{user_id: 1}
  end
end
