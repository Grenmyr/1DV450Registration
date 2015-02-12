class CreatorController < ApplicationController
  def index
    all = Creator.all
    selected_format(all)
  end
  def show
    creator = Creator.find(params[:id])
    selected_format(creator)
  end
end
