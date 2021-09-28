class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :birthday, presence: true
  validates :encrypted_password, :password, :password_confirmation,
            format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/ }

  with_options presence: true, format: { with: /\A[ぁ-ゔァ-ヴ一-龥]+\z/ } do
    validates :last_name
    validates :first_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヴー]+\z/u } do
    validates :last_name_kana
    validates :first_name_kana
  end
end
