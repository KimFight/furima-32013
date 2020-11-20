class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
       validates :nickname
       validates :last_name,:first_name,            format:  { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid."}
       validates :last_name_kana, :first_name_kana, format:  { with: /\A[ァ-ヶー－]+\z/, message: "is invalid."}
       validates :password,                         format:  { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]+\z/, message: "is invalid."}
       validates :birth_date
      end
end

