class BookingsController < ApplicationController
  def create
    # debugger
    @stripe_service = StripeService.new
    @workshop = Workshop.last#find(params[:workshop_id])
    @customer = Customer.find_by(email: params[:email])
    unless @customer.present?
      @customer = Customer.create(costumer_params)
    end
    @stripe_customer = @stripe_service.find_or_create_customer(@customer)

    @card = @stripe_service.create_stripe_customer_card(card_token_params, @stripe_customer)

    @amount_to_be_paid = params[:no_of_tickets].to_i * @workshop.registration_fee

    @charge = @stripe_service.create_stripe_charge(@amount_to_be_paid, @stripe_customer.id, @card.id, @workshop)

    @booking = @workshop.bookings.create(
      customer_id: @customer.id,
      stripe_customer_id: @charge.id,
      no_of_tickets: para[:no_of_tickets].to_i,
      amount_paid: @amount_to_be_paid
    )
    redirect_to workshops_path(@workshop), notice: 'Your ticket has been booked'

  # rescue Stripe::StripeError => error
  #   redirect_to workshops_path(@workshop), notice: "#{error.message}"
  end

  private 

  def costumer_params
    params.permit(:full_name, :email, :contact_number)
  end

  def card_token_params
    params.permit(:card_number, :exp_month, :exp_year, :cvv)
  end
end
