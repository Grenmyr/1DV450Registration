class Api::V1::PositionsController < ApisController
  before_action :developer_key_authentication
  def index
    all = Position.all
    offset_and_limit_params(all)
  rescue ActiveRecord::RecordNotFound
    @error = get_error_message
    selected_format(@error, :not_found)
  end
  def show
    position = Position.find(params[:id])
    selected_format({position: position, event: position.event}, :ok)
  rescue ActiveRecord::RecordNotFound
    @error = get_error_message
    selected_format(@error, :not_found)
  end

  def geocoder
    #http://localhost:3000/api/v1/positions/geocoder/?range=1000&location=Kalmar

    if params[:range].present? and params[:location].present?
      selected_format({position:  Position.near(params[:location], params[:range])}, :ok)
    else
      selected_format({position: Position.near("Sverige", 5000)}, :ok)
    end
  end
end
