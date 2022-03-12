class OrderAddress

  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :prefecture_id, :city, :town_number, :building_name, :phone_number, :order, :token
  
  with_options presence: true do
    validates :token
    validates :item_id
    validates :user_id
    validates :post_code, format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id, numericality: { other_than: 1}
    validates :city
    validates :town_number
    validates :phone_number,format: {with: /\A\d{10}\z|\A\d{11}\z/}
  end
  
  

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, town_number: town_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end