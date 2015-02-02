class ApisController < ApplicationController
  before_action :validate_login, only: [:edit]
  def edit
    @user = User.find(params[:id])
    @api = Api.find(@user)

    if @api.key.nil?
      @api.key =  ('a'..'z').to_a.shuffle[0,16].join
      if@api.save
        redirect_to user_path
        flash[:success] = 'New api key' +@api.key + ' was created'
      else
        render @user
        flash.now[:danger] = 'Api key could not be saved'
      end
    else
      @api.key = nil
      @api.save
      redirect_to user_path
      flash[:success] = 'Api key was removed'
    end
  end

end
