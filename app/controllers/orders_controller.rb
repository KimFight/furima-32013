class OrdersController < ApplicationController

def index
  @order = Order.new
  @item = Item.find(params[:item_id])
end

def create
  @item = Item.find(params[:item_id])
  @order = Order.new(order_params)
    if  @order.valid?
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
end

private

  def order_params
    params.require(:order).permit(:postal_code, :prefectures_id, :municipality, :address, :building_name, :phone_number)#.merge(purchase: current_user.id)
  end

end
