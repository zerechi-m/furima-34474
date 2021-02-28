class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]  # インスタンスの生成
  before_action :user_match, only: [:edit, :update, :destroy]       # 現在のユーザと出品者の合致
  before_action :soldout, only: [:edit, :update, :destroy]          # 商品がsoldoutかの分岐

  def index
    @items = Item.all.order(id: 'DESC')
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

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def user_match
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def soldout
    if @item.order.present?
      redirect_to root_path
    end
  end

  def item_params
    params.require(:item).permit(:name, :price, :describe, :image, :status_id, :category_id, :deliveryfee_id, :deliveryday_id,
                                 :prefecture_id).merge(user_id: current_user.id)
  end
end
