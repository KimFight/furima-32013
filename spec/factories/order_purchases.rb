FactoryBot.define do
  factory :order_purchase do
      postal_code       { "123-4567" }
      prefectures_id    { 7 }
      municipality      { "伊勢崎市" }
      address           { "青山" }
      building_name     { "めぞん一刻" }
      phone_number      { 12345678790 }
      user_id           { 4 }
      item_id           { 6 }
      token             {"tok_abcdefghijk00000000000000000"}
  end
end
