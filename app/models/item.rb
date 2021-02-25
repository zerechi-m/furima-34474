class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :category
  belongs_to :status
  belongs_to :deriveryfee
  belongs_to :deliveryday

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
    validates :price
  end

  with_options numericality: { other_than: 1 } do
    validates :perfecture_id
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :delivery_day_id
  end

  validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
  has_one_attached :image
end
