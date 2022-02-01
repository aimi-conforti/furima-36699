class OrderAddress

  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :prefecture_id, :city, :town_number, :building_name, :phone_number, :order

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, town_number: town_number, building_name: building_name, phone_number: phone_number, order: order)
  end
end