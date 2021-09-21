FactoryBot.define do
  factory :user do
    gimei = Gimei.name
    nickname {Faker::Games::Pokemon.name}
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    name1 {gimei.last.kanji}
    name2 {gimei.first.kanji }
    furigana1 {gimei.last.katakana}
    furigana2 {gimei.first.katakana}
    birthday { Faker::Date.birthday(min_age: 18,max_age: 72) }
  end
end