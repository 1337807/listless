class ListsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @current_user_lists = current_user.lists.sort
    @other_lists = (List.all - @current_user_lists).sort
  end

  def new
    @list = List.new
  end

  def create
    attributes = list_params
    attributes[:user] = current_user

    if list = List.create(attributes)
      redirect_to list_path(list)
    else
      render :new
    end
  end

  def show
    @list = List.find(params[:id])
    @items = @list.items.sort
    @owner = (@list.user == current_user)
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    attributes = list_params
    list = List.find(params[:id])

    if list.update_attributes(list_params)
      redirect_to lists_path
    else
      render :edit
    end
  end

  def destroy
    List.find(params[:id]).destroy
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
