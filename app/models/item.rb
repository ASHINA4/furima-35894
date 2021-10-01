class Item < ApplicationRecord
  # アソシエーションの設定
  belongs_to :user

  # バリデーションの設定
  with_options presence: true do
    validates :image
    validates :name, uniqueness: true, length: { maxmum: 100 }
    validates :info, uniqueness: true, length: { maxmum: 1000 }
    validates :category_id
    validates :ssales_status_id
    validates :shipping_fee_status_id
    validates :prefecture_id
    validates :scheduled_delivery_id
    validates :price, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 9_999_999 },
              format: { with: /\A[0-9]+\z/ }
  end