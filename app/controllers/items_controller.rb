class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.all.order(id: "DESC")
  end

  def new
    @item = Item.new
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
    params.require(:item).permit(:name, :price, :describe, :image, :status_id, :category_id, :deliveryfee_id, :deliveryday_id,
                                 :prefecture_id).merge(user_id: current_user.id)
  end
end
