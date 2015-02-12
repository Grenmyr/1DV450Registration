class PositionController < ApplicationController
  def index
    all = Position.all
    selected_format(all)
  end
  def show
    position = Position.find(params[:id])
    selected_format(position)
  end
end
