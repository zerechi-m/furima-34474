class OrderController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
  end

  def create
    binding.pry
    @order_address = OrderAddress(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def order_params
    params.require(:order_address).permit().merge(user_id: current_user[:id], item_id: params[:item_id])
  end
end
