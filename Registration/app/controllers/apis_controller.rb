class ApisController < ApplicationController
  def index
    @user = User.find(params[:id])
    @api = @user.api
  end
  def edit
    @user = User.find(params[:id])
  end

end
