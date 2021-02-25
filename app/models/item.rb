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
    validates :image
  end

  validates :price, presence: true, inclusion: {in: (300..9,999,999)}, format: { with: /\A(?=.*?[0-9])+\Z/}
  has_one_attached :image
end
