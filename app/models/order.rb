class Order < ApplicationRecord

  belongs_to :item
  belongs_to :user

  has_one :address

  validates :item, presence:true
  validates :user, presence:true
end
