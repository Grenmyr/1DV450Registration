class Api::V1::EventsController < ApisController
  #List all events
  before_action :require_params, only: [:update,:show, :destroy]

  def index
    offset_and_limit_params
  end
  # Show 1 event by ID
  def show
    selected_format({event: @event, positions: @event.positions, types: @event.types, createdBy: @event.creator} , :ok)
    #selected_format({events: @event,types: @event.types, positions: @event.positions} , :ok)
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
    @event = Event.new(name: event_params[:name],edible:event_params[:edible],amount:event_params[:amount])
    if @event.save
      selected_format({event: @event},:created)
    else
      error = create_error_message
      error[:developerMessage] = @event.errors
      selected_format(error, :bad_request)
    end
  end

  def update
      if @event.update(name: event_params[:name],edible:event_params[:edible],amount:event_params[:amount])
        selected_format({events: @event},:created)
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

  def close

  end

  private

  def event_params
    #Remember add requirement of creator ID .require(:creator)
    params.require(:event).permit(:name,:edible,:amount,:id,:position)
  end

  def require_params
    @event = Event.find(params[:id])
  end

  def offset_and_limit_params
    if params[:offset].present? and params[:limit].present?
      if params[:order].present? and params[:order] === 'date'
        events = Event.all.limit(params[:limit]).offset(params[:offset]).order('created_at DESC')
      else
        events = Event.all.offset(params[:offset]).limit(params[:limit])
      end
      selected_format({event: events},:created)
    else
      if params[:order].present? and params[:order] === 'date'
        events = Event.all.order('created_at DESC')
      else
        events = Event.all
      end
      selected_format({event: events},:created)
    end
  end

end
