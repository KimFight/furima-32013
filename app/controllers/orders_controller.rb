class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @order_purchase = OrderPurchase.new
    @item = Item.find(params[:item_id])  
      
      if current_user.id == @item.user_id || @item.purchase != nil
         return redirect_to root_path
      end
  end

  def create

    @item = Item.find(params[:item_id])
    @order_purchase = OrderPurchase.new(order_params)

    if  @order_purchase.valid?
        pay_item
        @order_purchase.save
        return redirect_to root_path
    else
        render 'index'
    end
  end

private

  def order_params
    params.require(:order_purchase).permit(:postal_code, :prefectures_id, :municipality, :address, :building_name, :phone_number, :purchase).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key =  ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: params[:token], 
        currency: 'jpy'
      )
  end
end
