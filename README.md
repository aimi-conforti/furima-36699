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
|date_of_birth          |date          |null:false                  |

###Association

- has_many : items
- has_many : items_purchase_contents

## items テーブル

|Column                  |Type              |Options                     |
|------------------------|------------------|----------------------------|
|user                    |references        |null:false,foreign_key:true |
|new_items               |string            |null:false            |
|items_explain           |text              |null:false                  |
|category_id             |integer           |null:false                  |
|sales_status_id         |integer           |null:false                  |
|postage_id              |integer           |null:false                  |
|shipping_date_id        |integer           |null:false                  |
|sell_price              |integer           |null:false                  |

###Association

- has_many : users
- has_one  : items-purchase-contents

##　 items-purchase-contents
|Column                  |Type          |Options                     |
|------------------------|--------------|----------------------------|
|purchased_item          |references    |foreign_key:true            |
|buyer                   |references    |null:false, foreign_key:true|

###Association

- belongs_to :users
- belongs_to :items

## items-delivery-contents
|Column                   |Type              |Options                    |
|-------------------------|------------------|---------------------------|
|post_code                |string            |null:false                 |
|prefecture               |collection_select |null:false                 |
|city                     |string            |null:false                 |
|town_number              |string            |null:false                 |
|buildings_name           |string            |                           |
|phone_number             |string            |null:false                 |
|purchase_history         |references        |foreign_key:true           |

###Association

-belongs_to: users
-belongs_to: items-purchase-contents