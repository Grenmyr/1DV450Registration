class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionHelper

  def validate_login
    unless logged_in?
      redirect_to root_path
    end
  end

  # Method to redirect to root if parameter can not be found.
  around_filter :catch_not_found

  private

  def catch_not_found
    yield
  rescue ActiveRecord::RecordNotFound
    redirect_to root_url, :flash => {:danger => "Parameter not found." }
  end
end
