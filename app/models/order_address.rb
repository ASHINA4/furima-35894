class OrderAddress
  # form_withとのバリデーション設定
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :city, :block, :building, :phone_number, :user_id, :item_id
  # /form_withとのバリデーション設定

  # addressのバリデーション設定
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :city
    validates :block
    validates :phone_number, format: {with: /\A[0-9]{10,11}\z/ }
  end
  # /addressのバリデーション設定

  # saveメソッドに保存するテーブルとカラムの設定
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, order_id: order.id)
  end
  # /saveメソッドに保存するテーブルとカラムの設定
end