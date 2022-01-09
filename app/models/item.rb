class Item < ApplicationRecord
  belongs_to : user
  has_one : item_purchase_contents
end
