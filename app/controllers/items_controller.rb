class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :new, :create, :show]
  before_action :set_item, only: [:show]
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

  def show
    # @post_item_user = @item.user
    @category = Category.find(@item.category_id)
    # area = ShippingPrefecture.all.pluck(:name)
    # @area = @item.area
    # condition = ItemCondition.all.pluck(:name)
    
    condition = ItemCondition.find(@item.item_condition_id)
    @condition = condition.name
    
    postage_payer =  PostagePayer.find(@item.postage_payer_id)
    @postage_payer = postage_payer.name
    
    shipping_day = ShippingDay.find(@item.shipping_day_id)
    @shipping_day = shipping_day.name
    
    shipping_prefecture = ShippingPrefecture.find(@item.shipping_prefecture_id)
    @shipping_prefecture = shipping_prefecture.name
 
  end

  def item_params
    params.require(:item).permit(:name, :introduction, :category_id, :brand, :item_condition_id, :postage_payer_id, :shipping_prefecture_id, :shipping_day_id, :price, :trading_status, images_attributes: [:url])
  end

  #ログインしていなくても一覧表示する
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
