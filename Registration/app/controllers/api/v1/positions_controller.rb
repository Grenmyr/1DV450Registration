class Api::V1::PositionsController < ApisController
  #List all Positions in the order and offset/limit client params want.
  def index
    all = Position.all
    offset_and_limit_and_order_params(all)
  end
  #Show position and the event its bound to
  def show
    position = Position.find(params[:id])
    selected_format({position: position, event: position.event}, :ok)
  rescue ActiveRecord::RecordNotFound
    @error = get_error_message
    selected_format(@error, :not_found)
  end

  #Function used to search for events in certain range, if not both parameters set show general.
  def geocoder
    if params[:range].present? and params[:location].present?
      selected_format({position:  Position.near(params[:location], params[:range])}, :ok)
    else
      selected_format({position: Position.near("Sverige", 5000)}, :ok)
    end
  end
end
