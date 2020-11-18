# README

##users テーブル

| Colum            | Type    | Options     |
| -----------------|---------|-------------|
| nickname         | string  | null: false |
| email            | string  | null: false |
|encrypted_password| string  | null: false |
| last_name        | string  | null: false |
| first_name       | string  | null: false |
| last_name_kana   | string  | null: false |
| first_name_kana  | string  | null: false |
| birth_date       | date    | null: false |



## Association

- has_many :items
- has_many :purchases

## items テーブル

| Colum               | Type        | Options                         |
| --------------------|-------------|---------------------------------|
| name                | string      | null: false                     |
| explanation         | text        | null: false                     |
| category_id         | integer     | null: false                     |
| status_id           | integer     | null: false                     |
| delivery_burden_id  | integer     | null: false                     |
| shipment_source_id  | integer     | null: false                     |
| days_id             | integer     | null: false                     |
| price               | integer     | null: false                     |
| user                | references  | null: false , foreign_key: true |


## Association

- belongs_to :user
- belongs_to :order

## orders テーブル

| Colum             | Type        | Options                         |
| ------------------|-------------|---------------------------------|
| postal_code       | string      | null: false                     |
| prefectures_id    | integer     | null: false                     |
| municipality      | string      | null: false                     |
| address           | string      | null: false                     |
| building_name     | string      |                                 |
| phone_number      | string      | null: false                     |
| purchases     　　 | references  | null: false , foreign_key: true |

## Association

- has_one    :item
- belongs_to :purchase

## purchasesテーブル

| Colum             | Type        | Options                         |
| ------------------|-------------|---------------------------------|
| user              | references  | null: false , foreign_key: true |
| item              | references  | null: false , foreign_key: true |


## Association
- belongs_to :user
- has_one    :order
