class Api::V1::TypesController < ApisController
  #List all Types in the order and offset/limit client params want.
  def index
    all = Type.all
    offset_and_limit_and_order_params(all)
  end
  def show
    @type = Type.find(params[:id])
    selected_format(@type, :ok)
  rescue ActiveRecord::RecordNotFound
    @error = get_error_message
    selected_format(@error, :not_found)
  end

end
