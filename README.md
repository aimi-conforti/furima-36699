＃テーブル設計

## users テーブル

|Column                 |Type          |Options                     |
|-----------------------|--------------|----------------------------|
|nickname               |string        |null:false                  |
|email                  |string        |null:false                  |
|password               |string        |null:false                  |
|name                   |string        |null:false                  |
|date of birth          |string        |null:false                  |

## items テーブル

|Column                  |Type          |Options                     |
|------------------------|--------------|----------------------------|
|img-upload              |string        |null:false                  |
|new-items               |string        |null:false                  |
|items_explain           |text          |null:false                  |
|items-detail            |text          |null:false                  |
|sell-price              |string        |null:false                  |

##　 items-sell-contents
|Column                  |Type          |Options                     |
|------------------------|--------------|----------------------------|
|img-upload              |string        |null:false                  |
|items-price             |string        |null:false                  |
｜item-postage            |string       |null:fase                   |
|detail-item              |string       |null:false                  |
|item-explain-box         |string       |null:false                  |
|comment-box              |text         |                           |

## items-delivery
|Column                   |Type          |Options                     |
|