FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"0807taiyou"}
    password_confirmation {password}
    family_name_china     {"西野"}
    first_name_china      {"太陽"}
    family_name_kana      {"ニシノ"}
    first_name_kana       {"タイヨウ"}
    birthday              {"2000/08/07"}
  end
end