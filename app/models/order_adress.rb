class OrderAddress 
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address, :building, :phone_number, :order_id, :item_id, :user_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :order_id
    validates :postal_code
    validates :prefecture_id
    validates :municipality
    validates :address
    validates :phone_number
   end

   def save
      order = Order.create()
   end

end