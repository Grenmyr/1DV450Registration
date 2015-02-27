class Api::V1::CreatorsController < ApisController
  before_action :client_key_authentication, only: [:update,:destroy]
  before_action :get_true_creator, only: [:update,:destroy]
  before_action :strong_creator_params, only: [:update]

  def index
    all = Creator.all
    offset_and_limit_and_order_params(all)
  end
  def show
    get_params
    if @creator
      selected_format(@creator, :ok)
    end
  end

  def update
    if @creator.update(name: strong_creator_params[:name])
      selected_format({creator: @creator},:created)
    else
      create_update_error
    end
  end

  def destroy
    if@creator.delete
      selected_format({creator: @creator},:no_content)
    else
      create_update_error
    end
  end

  private

  def get_params
    @creator =Creator.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    @error = get_error_message
    selected_format(@error, :not_found)
  end

  def get_true_creator
    @creator = Creator.find(@creators_id)
  rescue ActiveRecord::RecordNotFound
    @error = 'Creator can not be found'
    selected_format(@error, :not_found)
  end


  def strong_creator_params
    params.require(:creator).permit(:name,:submits)
  end

  def create_update_error
    error = create_error_message
    error[:developerMessage] = @creator.errors
    selected_format(error, :bad_request)
  end

end
