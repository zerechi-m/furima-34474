
# READ ME

## users テーブル

| Column             | Type            | Options     |
|--------------------|-----------------| ----------- |
| first_name         | string          | null: false |
| last_name          | string          | null: false |
| first_name kana    | string          | null: false |
| last_name kana     | string          | null: false |
| nickname           | string          | null: false |
| email              | string          | null: false |
| password           | integer         | null: false |
  
### Association

- has_many :listings 
- belongs_to :

## listings テーブル

| Column             | Type            | Options     |
|--------------------|-----------------| ----------- |
| name               | string          | null: false |
| describe           | text            | null: false |
| price              | integer         | null: false |
| image              | active storage  | null: false |
| delivery_fee       | integer         | null: false |
| delivery days      | integer         | null: false |
| Prefecture         | string          | null: false |
| kategory           | string          | null: false |
| purchase           | references      | foreign key |
| user               | references      | foreign key |

### Association

- belongs_to :purchase


## purchase テーブル

| Column             | Type            | Options     |
|--------------------|-----------------| ----------- |
| postal_code        | string          | null: false |
| Prefecture         | string          | null: false |
| municipality       | string          | null: false |
| address            | integer         | null: false |
| card_number        | integer         | null: false |
| phone_number       | integer         | null: false |

### Association

- belongs_to :listing