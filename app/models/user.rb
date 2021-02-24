class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  with_options presence: true, format: {with: /\A[ァ-ヶー－]+\z/, message:"全角文字を使用してください"} do
    validates :first_name_kana  
    validates :last_name_kana
  end
  validates :nickname, presence: true
  validates :birthday, presence: true

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: "passwordには半角英数字混合で入力してください"}
end
