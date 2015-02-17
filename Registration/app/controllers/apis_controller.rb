class ApisController < ApplicationController
  before_action :validate_login, only: [:edit]

  # User to set api key to nil or new random value.
  def edit
    @user = User.find(current_user.id)
    if @user.api.key.nil?
      @user.api.key =  ('a'..'z').to_a.shuffle[0,16].join
      if@user.api.save
        redirect_to @user
        flash[:success] = 'New api key' +@user.api.key + ' was created'
      else
        render @user
        flash.now[:danger] = 'Api key could not be saved'
      end
    else
      @user.api.key = nil
      @user.api.save
      redirect_to user_path
      flash[:success] = 'Api key was removed'
    end
  end

  #CODE FOR API

  def selected_format (search,optional)
    respond_to do |format|
      format.json { render json: search, status: optional }
      format.xml { render xml: search }
    end
  end

  def error_message
    {developerMessage: :"Could not find resource: #{params[:id]}",
     userMessage: :"Could not find any #{params[:id]}"}
  end

end
