class Order < ApplicationRecord
  # テーブル同士のアソシエーション
  belongs_to :user
  belongs_to :item
  has_one :address
  # /テーブル同士のアソシエーション
end
