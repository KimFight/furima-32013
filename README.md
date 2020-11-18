# README

##users テーブル

| Colum            | Type    | Options     |
| -----------------|---------|-------------|
| nickname         | string  | null: false |
| email            | string  | null: false |
| password         | string  | null: false |
|encrypted_password| string  | null: false |
| last name        | string  | null: false |
| first name       | string  | null: false |
| last name_kana   | string  | null: false |
| first name_kana  | string  | null: false |
| birth_date       | date    | null: false |



## Association

- has_many :items
- has_many :orders

## items テーブル

| Colum               | Type        | Options                         |
| --------------------|-------------|---------------------------------|
| name                | string      | null: false                     |
| explanation         | text        | null: false                     |
| category_id         | integer     | null: false                     |
| status_id           | integer     | null: false                     |
| delivery burden_id  | integer     | null: false                     |
| shipment source_id  | integer     | null: false                     |
| days_id             | integer     | null: false                     |
| price               | integer     | null: false                     |
| user                | references  | null: false , foreign_key: true |


## Association

- belongs_to :user
- has_one    :order

## orders テーブル

| Colum             | Type        | Options                         |
| ------------------|-------------|---------------------------------|
| postal code       | string      | null: false                     |
| prefectures_id    | integer     | null: false                     |
| municipality      | string      | null: false                     |
| address           | string      | null: false                     |
| building name     | string      |                     |
| phone number      | string      | null: false                     |
| item              | references  | null: false , foreign_key: true |

## Association

- belongs_to :user
- belongs_to :item
