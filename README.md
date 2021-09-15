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

| Type | Column | Options |
| ---- | ------ | ------- |
| t.string | :nickname,  | null: false |
| t.string | :email, | null: false|
| t.string | :password, | null: false |
| t.string | :password_confiremation, | null: false |
| t.string | :last_name, | null: false |
| t.string | :first_name, | null: false |
| t.string | :last_name_kana, | null: false |
| t.string | :first_name_kana, | null: false |
| t.date | :birthday, null: | false |

## items テーブル

| Type | Column | Options |
| ---- | ------ | ------- |
| image | activestorage |
| t.string | :name, | null: false |
| t.text | :info, | null: false |
| t.integer | :category_id, | null: false |
| t.integer | :sales_status_id, | null: false |
| t.integer | :shipping_fee_status_id, | null: false |
| t.integer | :prefecture_id, | null: false |
| t.integer | :scheduled_delivery_id, | null: false |
| t.integer | :price, | null: false |
| t.references |:user, | foreign_key: true |

## pay_forms テーブル

| Type | Column | Options |
| ---- | ------ | ------- |
| t.references | :number, foreign_key: true |
| t.references | :exp_month, foreign_key: true |
| t.references | :exp_year, foreign_key: true |
| t.references | :cvc, foreign_key: true |
| t.string | :email, | null: false |
| t.integer | :postal_code, | null: false |
| t.varchar | :prefecture, | null: false |
| t.integer | :city, | null: false |
| t.varchar | :addresses, | null: false |
| t.varchar | :building |
| t.bigint | :phone_number, | null: false |
| t.references | :user, | null: false, | foreign_key: true |
| t.references |:item, | null: false, | foreign_key: true |

## comments テーブル

| Type | Column | Options |
| ---- | ------ | ------- |
| t.text | :text, | null: false |
| t.references| :user, | foreign_key: true |
| t.references | :item, | foreign_key: true |

## comment_users テーブル

| Type | Column | Options |
| ---- | ------ | ------- |
| t.references | :comment, | foreign_key: true |
| t.references | :user, | foreign_key: true |

# テストコード
- Rspec
 - 単体テスト(model)
 - 統合テスト