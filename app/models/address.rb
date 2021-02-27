class Address < ApplicationRecord
  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :municipality
    validates :address
    validates :phone_number
    validates :order_id
  end

  belongs_to :order
end
