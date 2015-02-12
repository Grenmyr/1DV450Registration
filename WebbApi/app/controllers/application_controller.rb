class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def selected_format (search)
    respond_to do |format|
      format.json { render json: search }
      format.xml { render xml: search }
    end
  end
end
