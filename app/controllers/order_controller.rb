class OrderController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item_sold, only: [:index, :create]

  def index
    if current_user.id == @item.user_id
      redirect_to root_path
    else
      @order_address = OrderAddress.new
    end
  end

  def create
    @order_address = OrderAddress.new(order_params)

    if @order_address.valid?
      pay_order
      @order_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def set_item_sold
    @item = Item.find(params[:item_id])
    redirect_to root_path if @item.order.present?
  end

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :municipality, :address, :building, :phone_number).merge(
      user_id: current_user[:id], item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_order
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
