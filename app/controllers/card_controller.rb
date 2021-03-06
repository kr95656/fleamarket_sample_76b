class CardController < ApplicationController

  require "payjp"

  def new
    @card = Card.where(user_id: current_user.id)
    redirect_to card_index_path  if @card.exists?
  end

  def pay
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjp-token'].blank?
      redirect_to action: "new", alert: "クレジットカードが登録できませんでした。"
    else
      customer = Payjp::Customer.create(
        card: params['payjp-token'],
        metadata: {user_id: current_user.id}
      ) 
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "show"
      else
        redirect_to action: "pay"
      end
    end
  end

  def delete
    @card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    customer = Payjp::Customer.retrieve(@card.customer_id)
    customer.delete
    @card.delete
    if @card.delete
      redirect_to action: "new"
    else
      redirect_to action: "new", alert: "削除できませんでした。"
    end

  end

  def show
    @card = Card.where(user_id: current_user.id).first
    if @card.blank?
      redirect_to action: "new" 
    else
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    customer = Payjp::Customer.retrieve(@card.customer_id)
    @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end
end