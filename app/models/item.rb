class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :category
  belongs_to :status
  belongs_to :deliveryfee
  belongs_to :deliveryday

  with_options presence: true do
    validates :name
    validates :describe
    validates :status_id
    validates :category_id
    validates :deliveryfee_id
    validates :deliveryday_id
    validates :prefecture_id
    validates :user_id
    validates :image
    validates :price
  end

  with_options numericality: { other_than: 1 } do
    validates :prefecture_id
    validates :category_id
    validates :status_id
    validates :deliveryfee_id
    validates :deliveryday_id
  end

  validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }

  belongs_to :user

  has_one_attached :image
end
