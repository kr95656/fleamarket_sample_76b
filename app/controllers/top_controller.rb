class TopController < ApplicationController
  def index
    @items = Item.all.order(created_at: "DESC").limit(3)
  end
end
