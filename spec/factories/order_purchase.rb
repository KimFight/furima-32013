FactoryBot.define do
  factory :order_purchase do
    
    postal_code       {123-4567}
    prefectures_id    {7}
    municipality      {"伊勢崎市"}
    address           {"青山"}
    building_name     {"めぞん一刻"}
    phone_number      {12345678790}
    user              {5}
    item              {18}
    
  end
end