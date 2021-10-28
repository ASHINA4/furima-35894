class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # アソシエーションの設定
  has_many :items

  # バリデーションの設定
  with_options presence: true do
    validates :nickname
    validates :birthday
  end

  validates :encrypted_password, :password, :password_confirmation,
            presence: true, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/ }

  with_options presence: true, format: { with: /\A[ぁ-ゔァ-ヴ一-龥]+\z/ } do
    validates :last_name
    validates :first_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヴー]+\z/u } do
    validates :last_name_kana
    validates :first_name_kana
  end
end
