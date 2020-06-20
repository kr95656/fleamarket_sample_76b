class ItemsController < ApplicationController
  before_action :move_to_index, except: :index
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_parents, only: [:new, :create, :show, :edit, :update]

  def index
    @items = Item.all.order(created_at: "DESC").limit(3)
  end

  def new
    @item = Item.new
    @item.images.new
  end

  def categoryChildren
    @categoryChildren = Category.find(params[:selectedCategory]).children
  end

  def categoryGrandChildren
    @categoryGrandChildren = Category.find(params[:selectedCategory]).children
  end

  def edit 
    unless @item.user.id == current_user.id 
      redirect_to posts_path
      flash[:alert] = "権限がありません"
    end

    grandchild_category = @item.category
    child_category = grandchild_category.parent
    @category_parent_array = []
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent
    end
    @category_children_array = []
    Category.where(ancestry: child_category.ancestry).each do |children|
      @category_children_array << children
    end
    @category_grandchildren_array = []
    Category.where(ancestry: grandchild_category.ancestry).each do |grandchildren|
      @category_grandchildren_array << grandchildren
    end

  end

  def update
    @item.update(item_params)
    if @item.save
      flash[:notice] = "編集完了しました"
      redirect_to root_path
    else
      flash.now[:alert] = "編集に失敗しました"
      render ("items/edit")
    end
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

  def destroy
    if current_user.id == @item.user.id && @item.destroy
      flash[:notice] = "削除しました"
      redirect_to root_path
    else
      flash.now[:alert] = "削除に失敗しました"
      render ("items/show")
    end
  end



  def show
    @grandChild = @item.category
    @child = @grandChild.parent
    @parent = @child.parent

    # user = User.all
    @user = @item.user.nickname

    @category = Category.find(@item.category_id)
      
    condition = ItemCondition.find(@item.item_condition_id)
    @condition = condition.name
    
    postage_payer =  PostagePayer.find(@item.postage_payer_id)
    @postage_payer = postage_payer.name
    
    shipping_day = ShippingDay.find(@item.shipping_day_id)
    @shipping_day = shipping_day.name
    
    shipping_prefecture = ShippingPrefecture.find(@item.shipping_prefecture_id)
    @shipping_prefecture = shipping_prefecture.name
  end

  private
  def item_params
    params.require(:item).permit(:name, :introduction, :category_id, :brand, :item_condition_id, :postage_payer_id, :shipping_prefecture_id, :shipping_day_id, :price, :trading_status, images_attributes: [:url, :_destroy, :id]).merge(user_id: current_user.id)
  end

  #ログインしていなくても一覧表示する
  def move_to_index
    unless user_signed_in?
    flash.now[:alert] = "ログインをしてください"
    redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_parents
    @parents = Category.where(ancestry: nil)
  end

end
