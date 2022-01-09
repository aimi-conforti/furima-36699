class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: "must consist of more than six alphanumeric characters"
         
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "please enter in full width characters"} do
    validates :family_name
    validates :first_name
  end

  with_options presence: true, format: {with: /\A[ァ-ヴー]+\z/u, message: "please enter in full width katakana" } do
    validates :kana_family_name
    validates :kana_first_name
  end

  validates :nickname,         presence:true
  validates :date_of_birth,    presence:true
end
