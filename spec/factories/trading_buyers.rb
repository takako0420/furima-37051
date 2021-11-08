FactoryBot.define do
  factory :trading_buyer do
    token            { "tok_abcdefghijk00000000000000000" }
    post_number      { '123-4567' }
    prefecture_id    { rand(2..48) }
    city             { '東京都' }
    address          { '1-1' }
    building_name	   { '東京ハイツ' }
    phone_number     { '09012345678' }

    association :user
    association :item
  end
end
