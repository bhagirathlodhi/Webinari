FactoryBot.define do
  factory :refund do
    user { nil }
    booking { nil }
    no_of_tickets { 1 }
    state { "MyString" }
    stripe_refund_id { "MyString" }
    is_partial_refund { false }
    amount_refunded { 1.5 }
  end
end
