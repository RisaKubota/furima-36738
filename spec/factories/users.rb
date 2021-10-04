FactoryBot.define do
  factory :user do
    gimei = Gimei.name
    nickname {Faker::Games::Pokemon.name}
    email { Faker::Internet.free_email }
    password { '1a' + Faker::Internet.password(min_length: 6) }
              #  '1a' + テストコードに不具合が生じるため追加で記述しています
    password_confirmation { password }
    name1 {gimei.last.kanji}
    name2 {gimei.first.kanji }
    furigana1 {gimei.last.katakana}
    furigana2 {gimei.first.katakana}
    birthday { Faker::Date.birthday(min_age: 18,max_age: 72) }
  end
end