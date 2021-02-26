class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:show, :edit, :update]  # インスタンスの生成
  before_action :user_match, only: [:edit, :update]

  def index
    @items = Item.all.order(id: "DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show

  end
  
  def edit

  end

  def update
    if @item.update(item_params)
      redirect_to item_path(params[:id])
    else
      render action: :edit
    end
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def user_match
    unless current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def item_params
    params.require(:item).permit(:name, :price, :describe, :image, :status_id, :category_id, :deliveryfee_id, :deliveryday_id,:prefecture_id).merge(user_id: current_user.id)
  end
 
end
