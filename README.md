
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
| encrypted_password | integer         | null: false                   |
| birthday           | integer         | null: false                   |

### Association

- has_many :items
- has_one : purchase

## items テーブル

| Column             | Type            | Options     |
|--------------------|-----------------| ----------- |
| name               | string          | null: false |
| describe           | text            | null: false |
| price              | integer         | null: false |
| status_id          | integer         | null: false |
| category_id        | integer         | null: false |


### Association

- belongs_to :listing


## purchase テーブル

| Column             | Type            | Options     |
|--------------------|-----------------| ----------- |
| postal_code        | string          | null: false |
| Prefecture_id      | string          | null: false |
| municipality       | string          | null: false |
| address            | integer         | null: false |
| phone_number       | integer         | null: false |

### Association

- belongs_to :listing
- belongs_to :user


## delivery テーブル

| Column             | Type            | Options     |
|--------------------|-----------------| ----------- |
|
| delivery_fee_id    | integer         | null: false |
| delivery_days_id   | integer         | null: false |
| shipping area      | integer         | null: false |
| purchase           | references      | foreign key |
| user               | references      | foreign key |

### Association

- has_one :purchase
- belongs_to :user