class Api::V1::EventController < ApisController
  #List all events
  def index
    all_events = Event.all
    selected_format({allEvents: all_events}, :ok)
  end
  # Show 1 event by ID
  def show
    event = Event.find(params[:id])
    selected_format({event: event, positions: event.positions, types: event.types, createdBy: event.creator} , :ok)
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
    #@event = Event.new(name: params[:event][:name])
    @event = Event.new(name: post_params[:name],edible:post_params[:edible],amount:post_params[:amount])
    if @event.save
      selected_format({event: @event},:created)
    end
    #redirect_to api_v1_event_path(@event)
=begin
    @event = Event.new(event_params) # using strong parameters
    if @event.save
      # Todo here i need to ask my register app if this creator exist that is using the url key.
      creator =Creator.new(event_id: @event.id, name: 'Bosse', submits: 8888)
      creator.save
      @event.creator = creator
      selected_format({event: @event, positions: @event.positions, types: @event.types, createdBy: @event.creator},:created)
    else
      render 'new'
    end
=end
  end

  private

  def event_params
    #Remember add requirement of creator ID .require(:creator)
    params.permit(:name, :edible, :amount)
  end

  def post_params
    #Remember add requirement of creator ID .require(:creator)
    params.require(:event).permit(:name,:edible,:amount)
    #selected_format({error:'Could not save Data'}, :not_acceptable)
    end
end
