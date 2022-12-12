class Public::ItemsController < ApplicationController
    before_action :authenticate_customer!,except: [:index, :show]

  def show
    @cart_item = CartItem.new
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.all.page(params[:page]).per(10)
  end
end
