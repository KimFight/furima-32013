FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {"test@example"}
    password              {"000aaa"}
    password_confirmation {password}
    last_name             {"鈴木"}
    first_name            {"太郎"}
    last_name_kana        {"スズキ"}
    first_name_kana       {"タロウ"}
    birth_date            {"2020-01-01"}
  end
end