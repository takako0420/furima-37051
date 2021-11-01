# テーブル設計

## Users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_one :buyer
- has_many :items
- has_many :tradings

## Buyers テーブル

| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| user          | references | null: false, foreign_key:true |
| post_number   | string     | null: false                   |
| prefecture    | string     | null: false                   |
| city          | string     | null: false                   |
| address       | string     | null: false                   |
| building_name | string     |                               |
| phon_number   | integer    | null: false                   |

### Association

- belongs_to :user
- has_one :trading

## Items テーブル

| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| user          | references | null: false, foreign_key:true |
| item_name     | string     | null: false                   |
| price         | integer    | null: false                   |
| text          | text       | null: false                   |
| category      | string     | null: false                   |
| condition     | string     | null: false                   |
| shipping_fee  | string     | null: false                   |
| shipping_from | string     | null: false                   |
| shipping_date | string     | null: false                   |

### Association

- belongs_to :user
- has_one :trading

## Tradings テーブル

| Column | Type       | Options          |
| ------ | ---------- | ---------------- |
| item   | references | foreign_key:true |
| user   | references | foreign_key:true |
| buyer  | references | foreign_key:true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :buyer