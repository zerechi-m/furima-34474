
# READ ME

## users テーブル

| Column             | Type            | Options                       |
|--------------------|-----------------| ------------------------------|
| first_name         | string          | null: false                   |
| last_name          | string          | null: false                   |
| first_name_kana    | string          | null: false                   |
| last_name_kana     | string          | null: false                   |
| nickname           | string          | null: false                   |
| email              | string          | null: false , uniqueness: true|
| encrypted_password | string          | null: false                   |
| birthday           | date            | null: false                   |

### Association

- has_many :items
- has_many :order
- 

## items テーブル 

| Column             | Type            | Options          |
|--------------------|-----------------| -----------------|
| name               | string          | null: false      |
| describe           | text            | null: false      |
| price              | integer         | null: false      |
| status_id          | integer         | null: false      |
| category_id        | integer         | null: false      |
| delivery_fee_id    | integer         | null: false      |
| delivery_day_id    | integer         | null: false      |
| prefecture_id      | integer         | null: false      |
| user               | references      | foreign key:true |

### Association

- belongs_to :user
- has_one : order

## orders テーブル

| Column             | Type            | Options          |
|--------------------|-----------------| ---------------- |
| item               | references      | foreign key:true |
| user               | references      | foreign key:true |

### Association

- has_one :address
- belongs_to :item
- belongs_to :user

## addresses テーブル

| Column             | Type            | Options          |
|--------------------|-----------------| -----------------|
| postal_code        | string          | null: false      |
| prefecture_id      | integer         | null: false      |
| municipality       | string          | null: false      |
| address            | string          | null: false      |
| building           | string          |                  |
| phone_number       | string          | null: false      |
| order              | references      | foreign key:true |

### Association

- belongs_to :purchase

