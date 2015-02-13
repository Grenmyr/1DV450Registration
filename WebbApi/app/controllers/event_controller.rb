class EventController < ApplicationController


  def index
    all = Event.all
    selected_format(all, :ok)
  end
  def show
    event = Event.find(params[:id])
    test = event.positions
    selected_format([test,event] , :ok)
  # TODO: Add 1 in application controller instead?
  rescue ActiveRecord::RecordNotFound
    @error = error_message
    selected_format(@error, :not_found)
  end
end





