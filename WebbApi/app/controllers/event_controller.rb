class EventController < ApplicationController

  #List all events
  def index
    all_events = Event.all
    selected_format({allEvents: all_events}, :ok)
  end
  # Show 1 event by ID
  def show
    event = Event.find(params[:id])
    selected_format({event: event, positions: event.positions, tags: event.tags, createdBy: event.creator} , :ok)
  # TODO: Add 1 in application controller instead?
  rescue ActiveRecord::RecordNotFound
    @error = error_message
    selected_format(@error, :not_found)
  end

  # Route to create new Event, keep?
  def new
    @event = Event.new
  end

  # User when someone Post to API
  def create
    @event = Event.new(event_params) # using strong parameters
    #creator = Creator.new
    if @event.save
      # Todo here i need to ask my register app if this creator exist that is using the url key.
      creator =Creator.new(event_id: @event.id, name: 'Bosse', submits: 8888)
      creator.save
      redirect_to event_path(@event)
    else
      render 'new'
  end
  end

  private

  def event_params
    #Remember add requirement of creator ID .require(:creator)
    params.permit(:name, :edible, :amount)
  end


end