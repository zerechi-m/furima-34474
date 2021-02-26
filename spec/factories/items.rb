FactoryBot.define do
  factory :item do
    name           { Faker::Lorem.sentence }
    describe       { Faker::Lorem.sentence }
    price          { 100_000 }
    status_id      { 3 }
    category_id    { 5 }
    deliveryfee_id { 3 }
    deliveryday_id { 2 }
    prefecture_id  { 5 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
