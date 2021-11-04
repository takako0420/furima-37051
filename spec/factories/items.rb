FactoryBot.define do
  factory :item do
    item_name          { Faker::Lorem.sentence }
    price              { rand(300..9_999_999) }
    text               { Faker::Lorem.sentence }

    category_id        { rand(2..11) }

    condition_id       { rand(2..7) }
    shipping_fee_id    { rand(2..3) }
    prefecture_id      { rand(2..48) }
    shipping_date_id   { rand(2..4) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
    end
  end
end
