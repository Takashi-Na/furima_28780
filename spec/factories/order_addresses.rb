FactoryBot.define do
  factory :order_address do
    token         { "aaaa" }
    post_code     { "123-4567" }
    prefecture    { 13 }
    city          { "横浜市緑区" }
    address       { "青山1-1" }
    tel_num       { "09011112222" }
    user_id       { 1 }
    item_id       { 1 }
  end
end