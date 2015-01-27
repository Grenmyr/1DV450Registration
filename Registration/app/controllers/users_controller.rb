class UsersController < ApplicationController

  def index
    @users = User.all
    render :as_json => @users
  end

=begin
  def user_name
    @user = User.where(username: :username)
    render :json => @user
  end
=end
end
