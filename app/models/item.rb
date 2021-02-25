class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :describe
    validates :status_id
    validates :category_id
    validates :delivery_fee_id
    validates :delivery_day_id
    validates :prefecture_id
    validates :user
  end

  has_one_attached :image
end
