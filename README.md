＃テーブル設計

## users テーブル

|Column                 |Type          |Options                     |
|-----------------------|--------------|----------------------------|
|nickname               |string        |null:false                  |
|email                  |string        |null:false, unique:true     |
|encrypted_password     |string        |null:false                  |
|family_name            |string        |null:false                  |
|first_name             |string        |null:false                  |
|kana_family_name       |string        |null:false                  |
|kana_first_name        |string        |null:false                  |
|date of birth          |date          |null:false                  |

###Association

- has_many : items
- has_many : items_purchase_contents
- has_many : items_delivery_contents

## items テーブル

|Column                  |Type              |Options                     |
|------------------------|------------------|----------------------------|
|use_id                  |references        |null:false,foreign-key:true |
|new_items               |string            |null:false            |
|items_explain           |text              |null:false                  |
|category_id             |integer           |null:false                  |
|sales_status_id         |integer           |null:false                  |
|postage_id              |integer           |null:false                  |
|delivery_place_id       |references        |foreign-key:true            |
|shipping_date_id        |integer           |null:false                  |
|sell_price_id           |integer           |null:false                  |

###Association

- has_many : users
- has_many : items-purchase-contents

##　 items-purchase-contents
|Column                  |Type          |Options                     |
|------------------------|--------------|----------------------------|
|new_items               |references    |foreign-key:true            |
|items_price             |references    |foreign-key:true            |
|items_postage           |references    |foreign-key:true            |
|items_saler             |references    |foreign-key:true            |
|items_category          |references    |foreign-key:true            |
|items_sales_status      |references    |foreign-key:true            |
|items_postage           |references    |foreign-key:true            |
|delivery_place          |references    |foreign-key:true            |
|shipping_date           |references    |foreign-key:true            |
|buyer_id                |references    |null:false, foreign-key:true|
|comment_box             |text          |                            |

###Association

- belongs_to :users
- belongs_to :items

## items-delivery-contents
|Column                   |Type              |Options                    |
|-------------------------|------------------|---------------------------|
|new_items                |references        |foreign-key:true           |
|items_price              |references        |foreign-key:true           |
|items_postage            |references        |foreign-key:true           |
|total_payment            |references        |foreign-key:true           |
|post_code                |string            |null:false                 |
|prefecture               |collection_select |null:false                 |
|city                     |string            |null:false                 |
|town_number              |string            |null:false                 |
|buildings_name           |string            |                           |
|phone_number             |string            |null:false                 |

###Association

-belongs_to: users
-belongs_to: items-purchase-contents