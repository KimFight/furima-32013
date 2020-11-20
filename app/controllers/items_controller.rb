class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

private

  def item_paramas
    params.require(:item).permit(:image).merge(user_id: current_user.id)
  end
end
