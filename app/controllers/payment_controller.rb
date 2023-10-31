class PaymentController < ApplicationController

 def create
  @session = Stripe::Checkout::Session.create{

    payment_method_type: ['card'],
    line_items:[{
      name: workshop.name,
      amount: workshop.registration_fee,
      currency: "usd",
      quantity: 1
    }],
    mode: "payment",
    success_url: "https://example.com/success",
    cancel_url: "https://example.com/cancel"
  }

 end
end