class Address < ApplicationRecord
  # テーブル同士のアソシエーション
  has_one_attached :order
  belongs_to :order
  # /テーブル同士のアソシエーション

  # ActiveHashのモデルファイルとのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  # /ActiveHashのモデルファイルとのアソシエーション
end
