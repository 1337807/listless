class ItemsController < ApplicationController
  def new
    @item = Item.new(list_id: params[:list_id])
  end

  def create
    penny_params = item_params
    penny_params[:price] = Item.pennies_from_price(penny_params[:price])

    if item = List.find(params[:list_id]).items.create(penny_params)
      redirect_to list_path(item.list)
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :url, :price, :list_id)
  end
end
