require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

=begin
  test "Get /users should list all users" do
    assert_routing '/users',{controller: 'users', action:'index'}
    #get :index
    # kolla att response kommer
    assert_response :success
    #body i svaret försöker görs om till json
    body = JSON.parse(response.body)
    assert_equal body[0]['username'], User.first.username
  end
=end
end
