class Api::V1::TypesController < ApisController
  def index
    all = Type.all
    offset_and_limit_params(all)
  rescue ActiveRecord::RecordNotFound
    @error = get_error_message
    selected_format(@error, :not_found)
  end
  def show
    @type = Type.find(params[:id])
    selected_format(@type, :ok)
  rescue ActiveRecord::RecordNotFound
    @error = get_error_message
    selected_format(@error, :not_found)
  end



end
