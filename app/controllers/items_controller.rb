class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create
  end



private

  def item_paramas
    params.require(:item).permit(:image).merge(user_id: current_user.id)
  end
end
