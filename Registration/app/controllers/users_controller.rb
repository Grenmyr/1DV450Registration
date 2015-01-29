class UsersController < ApplicationController
  #kolla först om användare e inloggad  genom before_action
  def show
    @user = User.find(params[:id])
    #debugger
  end


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome #{@user.username}!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password,
                                 :password_confirmation)
  end

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
