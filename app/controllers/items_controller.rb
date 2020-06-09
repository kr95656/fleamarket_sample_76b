class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :new, :create]
  def index
    @items = Item.all.order(created_at: "DESC").limit(3)
  end

  def new
    @item = Item.new
    @item.images.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      flash[:notice] = "投稿完了しました"
      redirect_to root_path
    else
      flash.now[:alert] = "投稿に失敗しました"
      render ("items/new")
    end
  end

  def item_params
    params.require(:item).permit(:name, :introduction, :category_id, :brand, :item_condition_id, :postage_payer_id, :shipping_prefecture_id, :shipping_day_id, :price, :trading_status, images_attributes: [:url])
  end

  #ログインしていなくても一覧表示する
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
