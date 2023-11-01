class PaymentController < ApplicationController
  # skip_before_action :verify_authenticity_token
  after_action :notice, only: :create
  def create
    begin
      @workshop = Workshop.find(params[:id])
      session = Stripe::Checkout::Session.create({
        payment_method_types: ['card'],
        line_items: [{
          price_data: {
            currency: 'usd',
            product_data: {
              name: @workshop.name,
            },
            unit_amount: @workshop.registration_fee,
          },
          quantity: 1,
        }],
        mode: 'payment',
        success_url: root_url,
        cancel_url: root_url,
      })

      redirect_to session.url, allow_other_host: true
      
    rescue Exception => e
      e.class 
    end
  end  

  private

  def notice
    flash[:success] = "You have successfully booked the workshop!"
  end
end