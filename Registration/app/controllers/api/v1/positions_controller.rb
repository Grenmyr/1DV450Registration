class Api::V1::PositionsController < ApisController
  #List all Positions in the order and offset/limit client params want.
  before_action :require_params, only: [:update,:show,:destroy]
  before_action :client_key_authentication, only: [:create]
  def index
    all = Position.all
    offset_and_limit_and_order_params(all)
  end
  #Show position and the event its bound to
  def show
    position = Position.find(params[:id])
    selected_format({position: @position, event: @position.event}, :ok)
  rescue ActiveRecord::RecordNotFound
    @error = get_error_message
    selected_format(@error, :not_found)
  end
  def create
    position = Position.new(strong_positions_params)

      if position.save
        selected_format({position: position},:created)

        #Increasing that creators submit count with 1
        creator = Creator.find(@creators_id)
        creator.submits += 1
        creator.save
      else
        error = create_error_message
        error[:developerMessage] = position.errors
        selected_format(error, :bad_request)
      end
  end

  def update
    if @position.update(strong_positions_params)
      selected_format({position: @position},:created)
    else
      error = create_error_message
      error[:developerMessage] = @position.errors
      selected_format(error, :bad_request)
    end
  end

  def destroy
    if@position.delete
      selected_format({position: @position},:no_content)
    else
      error = create_error_message
      error[:developerMessage] = @position.errors
      selected_format(error, :bad_request)
    end
  end

  #Function used to search for events in certain range, if not both parameters set show general.
  def geocoder
    if params[:range].present? and params[:location].present?
      selected_format({position:  Position.near(params[:location], params[:range])}, :ok)
    else
      selected_format({position: Position.near("Sverige", 5000)}, :ok)
    end
  end
  def strong_positions_params
    params.require(:position).permit(:lat,:lng ,:amount,:event_id)
  end

  def require_params
    @position = Position.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    selected_format(get_error_message, :not_found)
  end
end
