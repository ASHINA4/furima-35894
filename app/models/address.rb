class Address < ApplicationRecord
  # テーブル同士のアソシエーション
  belongs_to :order
  # /テーブル同士のアソシエーション

  # ActiveHashのモデルファイルとのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  # /ActiveHashのモデルファイルとのアソシエーション
end
