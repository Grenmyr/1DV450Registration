class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception

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
