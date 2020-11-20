FactoryBot.define do
  factory :purchaces_user do
    postal_code { '123-4567' }
    prefecture_id { 1 }
    municipality { '岸和田市尾生町' }
    address { '1-1' }
    building_name { '大阪ハイツ' }
    phone_number { '09038660429' }
    token {"tok_abcdefghijk00000000000000000"}

  end
end
