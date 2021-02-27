class Order < ApplicationRecord
  with_options presence: true do
   validates :user
   validates :item
  end

  belongs_to :user
  belongs_to :item
end
