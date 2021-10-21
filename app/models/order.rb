class Order < ApplicationRecord
  # テーブル同士のアソシエーション
  belongs_to :user
  belongs_to :item
  # /テーブル同士のアソシエーション
end
