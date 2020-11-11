FactoryBot.define do
  factory :item do
    name           {"aaa"}
    explanation     {"aaaaaa"}
    category_id    {1}
    status_id      {1}
    burden_id      {1}
    prefecture_id  {1}
    days_id        {1}
    prace          {40000}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
   end
 end
