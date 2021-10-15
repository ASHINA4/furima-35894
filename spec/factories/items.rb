FactoryBot.define do
  factory :item do
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/star.png')) }
    name { 'a' * 40 }
    info { 'a' * 1000 }
    category_id { 1 }
    sales_status_id { 1 }
    shipping_fee_status_id { 1 }
    prefecture_id { 1 }
    scheduled_delivery_id { 1 }
    price { 300 }

    association :user
  end
end
