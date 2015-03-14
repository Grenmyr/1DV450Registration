class Api::V1::EventsController < ApisController
  #List all events
  before_action :require_params, only: [:update,:show, :destroy]
  before_action :client_key_authentication, only: [:create,:update,:destroy]

  #List all Events and Present them with params if user submitted them.
  def index
    all = Event.all
    offset_and_limit_and_order_params(all)
  end
  # Show event and the positions,types and creator who belong to it.
  def show
    selected_format({event: @event, positions: @event.positions, types: @event.types, createdBy: @event.creator} , :ok)
  end

  # Complicated I want Event only to save if certain conditions, se below.
  def create
    @event = Event.new(strong_event_params)
    #Make sure it is only the creator logged in with JWT that get registered.
    @event.creator_id = @creators_id

    #Make sure the creator added what type the event belong to, if not return with error.
    return selected_format(error = create_error_types,:bad_request) unless params[:event].has_key? :type_ids
    @event.types = Type.find(params[:event][:type_ids])

    #I want position to event, otherwise its useless data.
    position = Position.new(strong_positions_params)
    if @event.save
      position.event_id = @event.id

      if position.save
      selected_format({event: @event, position: position},:created)

      #Increasing that creators submit count with 1
      creator = Creator.find(@creators_id)
      creator.submits += 1
      creator.save
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
      if @event.update(strong_event_params)
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

  # Route used to list events by creator ID
  def find_by_creator
    require_creator_params
    if @creator
      selected_format({events: @creator.events} , :ok)
    end
  end
  private

  def strong_event_params
    params.require(:event).permit(:name,:edible,:taste)
  end

  def strong_positions_params
    params.require(:position).permit(:lat,:lng ,:amount)
  end


  #DO Repeat yourself
  def require_params
    @event = Event.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    selected_format(get_error_message, :not_found)
  end

  def require_type_params
    @type = Type.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    selected_format(get_error_message, :not_found)
  end

  def require_creator_params
    @creator = Creator.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    selected_format(get_error_message, :not_found)
  end

end
