class TagController < ApplicationController
  def index
    all = Tag.all
    selected_format(all)
  end
  def show
    tag = Tag.find(params[:id])
    selected_format(tag)
    end
end
