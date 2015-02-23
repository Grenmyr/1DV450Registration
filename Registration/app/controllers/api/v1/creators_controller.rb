class Api::V1::CreatorsController < ApisController
  def index
    all = Creator.all
    offset_and_limit_params(all)
  end
  def show
    creator = Creator.find(params[:id])
    selected_format(creator, :ok)
  end
end
