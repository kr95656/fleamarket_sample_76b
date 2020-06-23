class PurchaseController < ApplicationController
  before_action :set_item
  require 'payjp'

  def index
    @shipping_destination = ShippingDestination.find_by(user_id: current_user.id)
    shipping_prefecture = ShippingPrefecture.find(@item.shipping_prefecture_id)
    @shipping_prefecture = shipping_prefecture.name
    @card = Card.where(user_id: current_user.id).first
    if @card.blank?
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def pay
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    :amount => @item.price,
    :customer => card.customer_id,
    :currency => 'jpy',
  )
    redirect_to action: 'done'
  end

  def done
    @item.update(trading_status: "売り切れ")
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end

end