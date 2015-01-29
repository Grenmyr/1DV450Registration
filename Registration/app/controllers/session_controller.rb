class SessionController < ApplicationController
  # fran föreläsning

  def new
    #emty, new View will be loaded then.
  end


  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      #helpoers/sessionhelper
      #log_in user

      #redirect_to teams_path
    else
      #visa meddelande
    end

  end



end
