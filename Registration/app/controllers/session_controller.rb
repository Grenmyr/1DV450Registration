class SessionController < ApplicationController
  # fran föreläsning

  def new
    #emty, new View will be loaded then.
  end

  #Logs in user
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end




end
