FactoryBot.define do
  factory :user do
    gimei = Gimei.name
    first_name       {gimei.first.kanji}
    last_name        {gimei.last.kanji}
    first_name_kana  {gimei.first.katakana}
    last_name_kana   {gimei.last.katakana}
    nickname         {Gimei.first.katakana}
    birthday         {"1990-12-12"}
    email            {Faker::Internet.free_email}
    password         {Faker::Internet.password(min_length: 6, max_length: 20)}
    password_confirmation { password }
  end
end
