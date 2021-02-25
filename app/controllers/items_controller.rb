class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    redirect_to new_user_session_path unless user_signed_in?
  end

  def create
    @item = Item.new(purchase_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def purchase_params
    params.require(:item).permit(:name, :price, :describe, :image, :status_id, :category_id, :deliveryfee_id, :deliveryday_id, :prefecture_id).merge(user_id: current_user.id)
  end
end
