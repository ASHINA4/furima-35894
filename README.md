# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# 機能一覧

- ユーザー登録、ログイン機能(devise)
 - お気に入り登録
- 販売商品登録
 -  画像登録
- 商品購入
 - クレジット機能 
- コメント機能
- 検索機能

# テーブル設計  

## users テーブル

| Type | Column | Options | Options |
| ---- | ------ | ------- | ------- |
| string | nickname | null false |
| string | email | null false| unique true |
| string | encrypted_password | null false |
| string | last_name | null false |
| string | first_name | null false |
| string | last_name_kana | null false |
| string | first_name_kana | null false |
| date | birthday | null false |

## アソシエーション 

| has_many items |
| has_many pay_forms |
| has_many coment_users |
| has_many comments | through room_users |

## items テーブル

| Type | Column | Options |
| ---- | ------ | ------- |
| image | activestorage |
| string | name | null false |
| text | info | null false |
| integer | category_id | null false |
| integer | sales_status_id | null false |
| integer | shipping_fee_status_id | null false |
| integer | prefecture_id, | null false |
| integer | scheduled_delivery_id | null false |
| integer | price | null false |
| references |user | foreign_key true |

## アソシエーション

| belongs_to user |
| belongs_to payform |
| has_many comments |

## pay_forms テーブル

| Type | Column | Options | Options2 |
| ---- | ------ | ------- | ------- |
| integer | postal_code | null false |
| integer | prefecture_id | null false |
| string | city | null false |
| string | addresses | null false |
| string | building |
| string | phone_number | null false |
| references | user | null false | foreign_key true |
| references |item | null false | foreign_key true |

| belongs_to :user |
| belongs_to :item |

## comments テーブル

| Type | Column | Options |
| ---- | ------ | ------- |
| text | text | null false |
| references| user | foreign_key true |
| references | item | foreign_key true |

## アソシエーション

| has_many comment_users |
| has_many users | through comment_users |
| belongs_to item |

## comment_users テーブル

| Type | Column | Options |
| ---- | ------ | ------- |
| references | comment, | foreign_key true |
| references | user | foreign_key true |

## アソシエーション

| belongs_to comment |
| belongs_to user |

# テストコード
- Rspec
 - 単体テスト(model)
 - 統合テスト