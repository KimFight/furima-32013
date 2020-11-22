FactoryBot.define do
  factory :item do
    name                {"test"}
    explanation         {"test-test"}
    category_id         {2}
    status_id           {2}
    delivery_burden_id  {2}
    shipment_source_id  {2}
    day_id              {2}
    price               {300}
    user_id             {2}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
