FactoryBot.define do
  factory :user do
    nickname              {'test1'}
    email                 {'test@yahoo.it'}
    password              {'test1234'}
    password_confirmation {'test1234'}
    family_name           {'テスト'}
    first_name            {'太郎'}
    kana_family_name      {'テスト'}
    kana_first_name       {'タロウ'}
    date_of_birth         {'1930-1-1'}
  end
end