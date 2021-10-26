FactoryBot.define do
  factory :order_address do
    token { "tok_abcdefghijk00000000000000000" }
    postal_code { '123-4567' }
    prefecture_id { 1 }
    city { 'test' }
    block { 'test' }
    building { 'test' }
    phone_number { '09012345678' }

    association :user
    association :item
  end
end