＃テーブル設計

## users テーブル

|Column                 |Type          |Options                     |
|-----------------------|--------------|----------------------------|
|nickname               |string        |null:false                  |
|email                  |string        |null:false, unique:true     |
|encrypted-password     |string        |null:false                  |
|family-name            |string        |null:false                  |
|first-name             |string        |null:false                  |
|kana-family-name       |string        |null:false                  |
|kana-first-name        |string        |null:false                  |
|date of birth          |date          |null:false                  |

###Association

- has_many : items
- has_many : items-purchase-contents
- has_many : items-delivery-contents

## items テーブル

|Column                  |Type              |Options                     |
|------------------------|------------------|----------------------------|
|id                      |string            |null:false                  |
|new-items               |string            |null:false                  |
|items-explain           |text              |null:false                  |
|genre-id                |collection_select |null:false                  |
|items-sales-status      |collection_select |null:false                  |
|items-postage           |collection_select |null:false                  |
|delivery-place          |collection_select |foreign-key:true            |
|shipping-date           |collection_select |null:false                  |
|sell-price              |integer           |null:false                  |

###Association

- has_many : users
- has_many : items-purchase-contents

##　 items-purchase-contents
|Column                  |Type          |Options                     |
|------------------------|--------------|----------------------------|
|new-items               |string        |null:false                  |
|items-price             |integer       |null:false                  |
|items-postage           |string        |null:fase                   |
|items-saler             |string        |null:false                  |
|items-category          |string        |null:false                  |
|items-sales-status      |string        |null:false                  |
|items-postage           |string        |null:false                  |
|delivery-place          |string        |foreign-key:true            |
|shipping-date           |string        |null:false                  |
|comment-box             |text          |                            |

###Association

- belongs_to :users
- belongs_to :items

## items-delivery-contents
|Column                   |Type              |Options                    |
|-------------------------|------------------|---------------------------|
|new-items                |string            |null:false                 |
|items-price              |integer           |null:false                 |
|items-postage            |string            |null:false                 |
|total-payment            |integer           |foreign-key:true           |
|post-code                |string            |null:false                 |
|prefecture               |collection_select |null:false                 |
|city                     |string            |null:false                 |
|town-number              |string            |null:false                 |
|buildings-name           |string            |                           |
|phone-number             |string            |null:false                 |

-belongs_to: users
-belongs_to: items-purchase-contents