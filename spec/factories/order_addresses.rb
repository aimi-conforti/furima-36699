FactoryBot.define do
  factory :order_address do
    token {"tok_abcdefghijk00000000000000000"}
    post_code {'123-4566'}
    prefecture_id {2}
    city {'函館市'}
    town_number {'函館1-1'}
    building_name {'函館ハイツ'}
    phone_number {'09012345678'}
  end
end