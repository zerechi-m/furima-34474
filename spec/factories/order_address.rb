FactoryBot.define do
  factory :order_address do
   postal_code    {"000-0000"}
   prefecture_id  { 2 }
   municipality   {"テスト市"}
   address        {"1-1-1"}
   phone_number   { 1234567890 }
   token          {"tok_abcdefghijk00000000000000000"}
  end
end