class Api::V1::EventsController < ApisController
  #List all events
  before_action :require_params, only: [:update,:show, :destroy]
  before_action :developer_key_authentication
  before_action :client_key_authentication, only: [:create,:update,:destroy]

  def index
    all = Event.all
    offset_and_limit_and_order_params(all)
  end
  # Show 1 event by ID
  def show
    creator = Creator.find(@event.creators_id)
    selected_format({event: @event, positions: @event.positions, types: @event.types, createdBy: creator} , :ok)
  end

  # Route to create new Event, keep?
  def new
    @event = Event.new
  end

  # User when someone Post to API
  def create
    @event = Event.new(name: event_params[:name],edible:event_params[:edible],amount:event_params[:amount])
    @event.creator_id = @creators_id

    return selected_format(error = create_error_types,:bad_request) unless params[:event].has_key? :type_ids
    @event.types = Type.find(params[:event][:type_ids])

    position = Position.new(lat: positions_params[:lat], lng: positions_params[:lng], event_id: @event.id)
    if @event.save
      if position.save
      selected_format({event: @event, position: position},:created)
      else
        error = create_error_message
        error[:developerMessage] = position.errors
        selected_format(error, :bad_request)
      end
    else
        error = create_error_message
        error[:developerMessage] = @event.errors
        selected_format(error, :bad_request)
    end
  end

  def update
      if @event.update(name: event_params[:name],edible:event_params[:edible],amount:event_params[:amount])
        selected_format({events: @event},:created)
      else
        error = create_error_message
        error[:developerMessage] = @event.errors
        selected_format(error, :bad_request)
      end
  end

  def destroy
    if@event.delete
      selected_format({event: @event},:no_content)
    else
      error = create_error_message
      error[:developerMessage] = @event.errors
      selected_format(error, :bad_request)
    end
  end

  def find_by_type
    require_type_params
    if @type
    selected_format({events: @type.events} , :ok)
      end
  end

  def find_by_creator
    require_creator_params
    if @creator
      selected_format({events: @creator.events} , :ok)
    end
  end
  private

  def event_params
    params.require(:event).permit(:name,:edible,:amount)
  end

  def positions_params
    params.require(:position).permit(:lat,:lng)
  end

  def require_params
    @event = Event.find(params[:id])

  rescue ActiveRecord::RecordNotFound
    @error = get_error_message
    selected_format(@error, :not_found)
  end

  def require_type_params
    @type = Type.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    @error = get_error_message
    selected_format(@error, :not_found)
  end

  def require_creator_params
    @creator = Creator.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    @error = get_error_message
    selected_format(@error, :not_found)
  end

end
