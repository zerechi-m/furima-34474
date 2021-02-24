class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: "漢字・ひらがな・カタカナ可能"} do
    validates :first_name
    validates :last_name
  end

  with_options presence: true, format: {with: /\A[ァ-ヶ一-]+\z/, message: "全角文字を使用してください"} do
    validates :first_name_kana  
    validates :last_name_kana
  end

  with_options presence: true do
    validates :nickname
    validates :birthday
  end

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: "passwordには半角英数字混合で入力してください"}
end
