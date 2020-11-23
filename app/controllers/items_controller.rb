class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path(@item)
    else
      render :new
    end
  end

  def show
  end

  def edit
    unless user_signed_in? && current_user.id == @item.user_id
      redirect_to action: :index
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    unless user_signed_in? && current_user.id == @item.user_id
    @item.destroy
    redirect_to action: :index
   end
  end
 

private

  def item_params
    params.require(:item).permit(:name, :image, :explanation, :category_id, :status_id, :delivery_burden_id, :shipment_source_id, :day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
