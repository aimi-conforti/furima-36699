class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to :category
  belongs_to :sales_status
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :shipping_date
  
  has_one :order
  has_one_attached :image

  validates :image, presence:true
  validates :new_items, presence: true
  validates :items_explain, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :sales_status_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :postage_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_date_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :sell_price, numericality: { only_integer:true, greater_than_or_equal_to:300, less_than: 9999999 }
end
