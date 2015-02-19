class Api::V1::PositionsController < ApisController
  def index
    all = Position.all
    selected_format(all, :ok)
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
    #http://localhost:3000/api/v1/positions/geocoder/?range=1000&location=oslo
    if params[:range].present? and params[:location].present?
      selected_format({position:  Position.near(params[:location], params[:range])}, :ok)
    #render json: Position.near("Gothenburg", params[:range])
    else
      selected_format({position:  Position.near("sverige", 5000)}, :ok)
    end
  end
end
