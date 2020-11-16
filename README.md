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
| birth month      | string  | null: false |
| birth day        | string  | null: false |



## Association

- has_many :items
- has_many :orders

## items テーブル

| Colum               | Type        | Options                         |
| --------------------|---------    |---------------------------------|
| image          (Active Storage)                                     |
| name                | string      | null: false                     |
| explanation         | string      | null: false                     |
| category            | string      | null: false                     |
| status              | string      | null: false                     |
| delivery burden     | string      | null: false                     |
| shipment source     | string      | null: false                     |
| days                | string      | null: false                     |
| price               | string      | null: false                     |
| user_id             | references  | null: false , foreign_key: true |


## Association

- belongs_to :user
- has_one    :order

## orders テーブル

| Colum             | Type        | Options                         |
| ------------------|-------------|---------------------------------|
| card information  | string      | null: false                     |
| expiration date   | string      | null: false                     |
| security code     | string      | null: false                     |
| postal code       | string      | null: false                     |
| prefectures       | string      | null: false                     |
| municipality      | string      | null: false                     |
| address           | string      | null: false                     |
| building name     | string      | null: false                     |
| phone number      | string      | null: false                     |
| item_id           | references  | null: false , foreign_key: true |

## Association

- belongs_to :user
- belongs_to :item
