class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    with_options format: { with: /\A[ぁ-んァ-ン一-龥々]/} do
      validates :name1
      validates :name2
    end
    with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
      validates :furigana1
      validates :furigana2
    end
    validates :birthday
    validates :password,format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i }
  end
end
