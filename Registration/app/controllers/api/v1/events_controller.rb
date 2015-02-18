class Api::V1::EventsController < ApisController
  #List all events
  def index
    all_events = Event.all
    selected_format({allEvents: all_events}, :ok)
  end
  # Show 1 event by ID
  def show
    event = Event.find(params[:id])
    selected_format({events: event, positions: event.positions, types: event.types, createdBy: event.creator} , :ok)
      # TODO: Add 1 in application controller instead?
  rescue ActiveRecord::RecordNotFound
    @error = get_error_message
    selected_format(@error, :not_found)
  end

  # Route to create new Event, keep?
  def new
    @event = Event.new
  end

  # User when someone Post to API
  def create
    @event = Event.new(name: post_params[:name],edible:post_params[:edible],amount:post_params[:amount])
    if @event.save
      selected_format({events: @event},:created)
    else
      error = create_error_message
      error[:developerMessage] = @event.errors
      selected_format(error, :bad_request)
    end
  end

  private

  def event_params
    #Remember add requirement of creator ID .require(:creator)
    params.permit(:name, :edible, :amount)
  end

  def post_params
    #Remember add requirement of creator ID .require(:creator)
    params.require(:events).permit(:name,:edible,:amount)

  rescue ActionController::ParameterMissing

  end
end
