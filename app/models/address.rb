class Address < ApplicationRecord
  belongs_to :order

  validates :post_code, presence:true
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}numericality: { other_than: 1 , message: "can't be blank"}
  validates :city, presence:true
  validates :town_number, presence:true
  validate  :building_name 
  validates :phone_number, presence:true
  validates :order, presence:true
end
