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

## items テーブル

|Column                  |Type          |Options                     |
|------------------------|--------------|----------------------------|
|new-items               |text          |null:false                  |
|items-explain           |text          |null:false                  |
|items-category          |text          |null:false                  |
|items-sales-status      |text          |null:false                  |
|items-postage           |string        |null:false                  |
|delivery-place          |string        |null:false                  |
|shipping-date           |string        |null:false                  |
|sell-price              |integer       |null:false                  |

##　 items-purchase-contents
|Column                  |Type          |Options                     |
|------------------------|--------------|----------------------------|
|new-items               |text          |null:false                  |
|items-price             |integer       |null:false                  |
|items-postage           |string        |null:fase                   |
|items-saler             |string        |null:false                  |
|items-category          |string        |null:false                  |
|items-sales-status      |string        |null:false                  |
|items-postage           |string        |null:false                  |
|delivery-place          |string        |null:false                  |
|shipping-date           |string        |null:false                  |
|comment-box             |text          |                            |

## items-delivery-contents
|Column                   |Type          |Options                    |
|-------------------------|--------------|---------------------------|
|new-items                |string        |null:false                 |
|items-price              |integer        |null:false                 |
|items-postage            |string        |null:false                 |
|credit-card-info         |string        |null:false                 |
|date-of-expire           |text          |null:false                 |
|security-code            |text          |null:false                 |
|post-code                |text          |null:false                 |
|prefecture               |string        |null:false                 |
|city                     |text          |null:false                 |
|town-number              |text          |null:false                 |
|buildings-name           |text          |null:false                 |
|phone-number             |text          |null:false                 |