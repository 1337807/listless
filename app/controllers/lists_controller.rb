class ListsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @lists = current_user.lists
  end

  def new
    @list = List.new
  end

  def create
    attributes = list_params
    attributes[:user] = current_user

    if List.create(attributes)
      redirect_to lists_path
    else
      render :new
    end
  end

  def show
    @list = List.find(params[:id])
    @items = @list.items
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
