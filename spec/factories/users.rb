FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
    family_name           { '苗字みょうじミョウジ' }
    first_name            { '名前なまえナマエ' }
    family_name_kana      { 'ミョウジ' }
    first_name_kana       { 'ナマエ' }
    birthday              { '2000-01-01' }
  end
end
