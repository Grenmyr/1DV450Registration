class UsersController < ApplicationController
  before_action :validate_login, only: [:show,:index]
  before_action :correct_user,   only: [:show,:edit,:update]
  before_action :admin_user,     only: [:destroy,:index]


  def show
    @user = User.find(params[:id])
  end

begin
  def new
    @user = User.new
  end
end

  #Update acount info
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  # Create account
  def create
    @user = User.new(user_params)
    apikey = SecureRandom.hex
    api = Api.new()
    api.key = apikey
    @user.api = api
    #@user.api = api
    if @user.save
      api.user = @user
      api.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome #{@user.username}!"
      redirect_to @user
    else
      render 'new'
    end
  end

  #Admins can list user with it
  def index
    @users = User.paginate(page: params[:page], :per_page => 10)
  end

  #Admins can destroy users.
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end


  private
  # using secure params to whitelist what paramets is accesable.
  def user_params
    params.require(:user).permit(:username, :email, :password,
                                 :password_confirmation)
  end

  # Confirms the correct user or Admin.
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user) or  current_user.admin?
  end

  # Confirms an admin user.
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

end
