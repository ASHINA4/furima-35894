class Item < ApplicationRecord
  # テーブル同士のアソシエーション
  belongs_to :user

  # レコードとファイルを1対1の関係で紐づけるアソシエーション
  has_one_attached :image
  
  # ActiveHashのモデルファイルとのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery

  # バリデーションの設定
  with_options presence: true do
    validates :image
    validates :name, uniqueness: true, length: { maximum: 40 }
    validates :info, uniqueness: true, length: { maximum: 1000 }
    validates :category_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :sales_status_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :shipping_fee_status_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :scheduled_delivery_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
              format: { with: /\A[0-9]+\z/ }
  end
end