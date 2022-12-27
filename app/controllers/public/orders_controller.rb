class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

 def index
    @orders = current_customer.orders.all
 end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def new #注文情報入力
    @addresses = current_customer.addresses
    @address = Address.new
    @order = Order.new
  end

  def create　#データベースへ情報送信
    session[:total_payment] = params[:total_payment]
    if session[:address].present? && session[:total_payment].present?
      redirect_to infor_path
    else
      flash[:order_new] = "支払い方法と配送先を選択して下さい"
      redirect_to new_order_path
    end
  end

  def check #注文情報入力された情報の確認
      @cart_items = current_customer.cart_items.all
      @order = Order.new(
      payment: session[:total_payment].to_i,
      name: session[:name],
      postal_code: session[:postal_code],
      address: session[:address],
      shipping_cost: 800
    )
    @sum = 0
    @subtotals = @cart_items.map { |cart_item| (Item.find(cart_item.item_id).price * 1.1 * cart_item.amount).to_i }
    @sum = @subtotals.sum
    session[:sum] = @sum
  end

def completed #サンクスページ　
		order = Order.new(session[:order])
		order.save

		if session[:new_address]
			address = current_customer.addresses.new
		  address.postal_code = order.postal_code
			address.address = order.address
			address.name = order.name
			address.save
			session[:new_address] = nil
		end
end

  private
   def address_params
     params.require(:address).permit(:customer_id,:name, :postal_code, :address)
   end
   def order_params
     params.require(:order).permit(:customer_id, :address, :payment_method, :total_payment)
   end

   def calculate(user)
     total_price = 0
     user.cart_items.each do |cart_item|
       total_price += cart_item.amount * cart_item.item.price
     end
     return (total_price * 1.1).floor
   end
end