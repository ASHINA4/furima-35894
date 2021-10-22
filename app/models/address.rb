class Address < ApplicationRecord
  # テーブル同士のアソシエーション
  has_one_attached :order
  # /テーブル同士のアソシエーション
end
