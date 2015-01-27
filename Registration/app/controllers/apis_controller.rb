class ApisController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @api = @user.api
  end

end
