class TagController < ApplicationController
  def index
    all = Tag.all
    selected_format(all, :ok)
  rescue ActiveRecord::RecordNotFound
    @error = error_message
    selected_format(@error, :not_found)
  end
  def show
    tag = Tag.find(params[:id])
    selected_format(tag, :ok)
  rescue ActiveRecord::RecordNotFound
    @error = error_message
    selected_format(@error, :not_found)
    end
end
