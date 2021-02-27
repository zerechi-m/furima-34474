class OrderAddress 
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address, :building, :phone_number, :order_id, :item_id, :user_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :order_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}+\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank"}
    validates :municipality
    validates :address
    validates :phone_number
   end

   def save
      order = Order.create(item_id: item_id, user_id: user_id)
      Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality , address: address, building: building, order_id: order.id)
   end

end