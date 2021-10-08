FactoryBot.define do
  factory :order do
    token {"tok_abcdefghijk0000007210000"}
    post_code         {"123-5678"}
    prefecture_id     {3}
    city              {"市町"}
    city_address      {"番地"}
    building_name     {"建物名"}
    phone_number      {"0120333906"}
    
  end
end
