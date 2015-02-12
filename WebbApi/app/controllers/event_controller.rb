class EventController < ApplicationController
  def index
    all = Event.all
    selected_format(all)
  end
  def show
    event = Event.find(params[:id])
    selected_format(event)
  end
end
