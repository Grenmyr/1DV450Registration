class Api::V1::PositionController < ApisController
  def index
    all = Position.all
    selected_format(all, :ok)
  rescue ActiveRecord::RecordNotFound
    @error = error_message
    selected_format(@error, :not_found)
  end
  def show
    position = Position.find(params[:id])
    selected_format(position, :ok)
  rescue ActiveRecord::RecordNotFound
    @error = error_message
    selected_format(@error, :not_found)
  end
end
