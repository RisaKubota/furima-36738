class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :name1
    validates :name2
      with_options format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/ } do
        validates :furigana1
        validates :furigana2
      end
    validates :birthday
  end
end
