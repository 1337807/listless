class ItemsController < ApplicationController
  def new
    @item = Item.new(list_id: params[:list_id])
  end

  def create
    if item = List.find(params[:list_id]).items.create(item_params)
      redirect_to list_path(item.list)
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update_attributes(item_params)
    redirect_to list_path(item.list)
  end

  def destroy
    item = Item.find(params[:id]).destroy
    redirect_to list_path(item.list)
  end

  private

  def item_params
    permitted_params = params.require(:item).permit(:name, :url, :price, :list_id)
    permitted_params[:price] = Item.pennies_from_price(permitted_params[:price])
    permitted_params
  end
end
