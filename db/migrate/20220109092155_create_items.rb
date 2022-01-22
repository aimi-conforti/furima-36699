class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,             null: false, foreign_key: true
      t.string     :new_items,        null: false
      t.text       :items_explain,    null: false
      t.integer    :category_id,      null: false
      t.integer    :sales_status_id,  null: false
      t.integer    :postage_id,       null: false
      t.integer    :prefecture_id,    null: false
      t.integer    :shipping_date_id, null: false
      t.integer    :sell_price,       null: false


      t.timestamps
    end
  end
end
