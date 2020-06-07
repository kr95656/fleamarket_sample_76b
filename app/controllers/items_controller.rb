class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render ("items/new")
    end
    
  end

  def item_params
    params.require(:item).permit(:name, :introduction, :category_id, :brand, :item_condition_id, :postage_payer_id, :shipping_prefecture_id, :shipping_day_id, :price, images_attributes: [:url])
  end
end
