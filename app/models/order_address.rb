class OrderAddress

  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :prefecture_id, :city, :town_number, :building_name, :phone_number, :order
  attr_accessor :token
  validates :token, presence: true
  
  with_options presence: true, format: {with: /\A\d{3}[-]\d{4}\z/, message: "is invalid"} do
    validates :post_code
  end

  with_options presence: true, format: {with: /\A\d{10}\z|\A\d{11}\z/, message: "is invalid"} do
    validates :phone_number
  end

  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :city, presence:true
  validates :town_number, presence:true

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, town_number: town_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end