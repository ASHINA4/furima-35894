class Address < ApplicationRecord
  # テーブル同士のアソシエーション
  belongs_to :order
  # /テーブル同士のアソシエーション
end
