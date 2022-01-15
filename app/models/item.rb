class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to :category
  belongs_to :sales_status
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :shipping_date
  has_one :item_purchase_contents
  has_one_attached :image

  validates :content, presence: true, unless: :was_attached?

  def was_attached?
    self.image.was_attached?
  end
end
