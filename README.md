
# READ ME

## users テーブル

| Column             | Type            | Options                       |
|--------------------|-----------------| ------------------------------|
| first_name         | string          | null: false                   |
| last_name          | string          | null: false                   |
| first_name kana    | string          | null: false                   |
| last_name kana     | string          | null: false                   |
| nickname           | string          | null: false                   |
| email              | string          | null: false , uniqueness: true|
| encrypted_password | string          | null: false                   |
| birthday           | date            | null: false                   |

### Association

- has_many :items
- has_one : purchase

## items テーブル 

| Column             | Type            | Options          |
|--------------------|-----------------| -----------------|
| name               | string          | null: false      |
| describe           | text            | null: false      |
| price              | integer         | null: false      |
| status_id          | integer         | null: false      |
| category_id        | integer         | null: false      |
| delivery_fee_id    | integer         | null: false      |
| delivery_days_id   | integer         | null: false      |
| shipping area      | integer         | null: false      |
| user               | references      | foreign key:true |


### Association

- belongs_to :user
- has_one :purchase
- has_one :delivery


## purchase テーブル

| Column             | Type            | Options          |
|--------------------|-----------------| -----------------|
| postal_code        | string          | null: false      |
| prefecture_id      | integer         | null: false      |
| municipality       | string          | null: false      |
| address            | integer         | null: false      |
| phone_number       | integer         | null: false      |
| items_id           | references      | foreign key:true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :delivery


## delivery テーブル

| Column             | Type            | Options          |
|--------------------|-----------------| ---------------- |
| user               | references      | foreign key:true |
| purchase           | references      | foreign key:true |

### Association

- belongs_to :purchase
- belongs_to :item