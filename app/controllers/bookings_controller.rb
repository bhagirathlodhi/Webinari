class BookingsController < ApplicationController
  before_action :authenticate_user!, except: :payment_completed
  

  def all_booking
    @bookings = current_user.bookings.all
  end

  # Stripe code 
  def create
    begin
      @workshop = Workshop.find(params[:workshop_id])
      total_amount = @workshop.registration_fee * params[:no_of_tickets].to_i

      session = Stripe::Checkout::Session.create({
        payment_method_types: ['card'],
        metadata: {
  
        workshop_id: @workshop.id,
        no_of_tickets: params[:no_of_tickets],
        user_id: current_user.id
           
        },
        line_items: [{
          price_data: {
            currency: 'inr',
            product_data: {
              name: @workshop.name,
            },
            unit_amount: total_amount * 100,
          },
          quantity: 1,
        }],
        mode: 'payment',
        success_url: root_url,
        cancel_url: root_url
      })

      redirect_to session.url, allow_other_host: true
      
    rescue Exception => e
      e.class 
    end
  end  

  def payment_completed
    payload= request.body.read
    event= nil
    endpoint_secret= 'whsec_zj3T0ds0ir0JguPKPVLbogowvAS7KHZr'
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']
    begin
      event = Stripe::Webhook.construct_event(payload, sig_header, endpoint_secret)
    rescue  JSON::ParserError => e
      # Invalid payload
      status 400
      return
    end

    case event.type
      when 'checkout.session.completed'
        session = event.data.object
        @user= session.metadata.user_id
        @workshop_id = session.metadata.workshop_id
        @no_of_tickets = session.metadata.no_of_tickets
        @booking = Booking.new(no_of_tickets: @no_of_tickets, workshop_id: @workshop_id, user_id: @user)
       
        if @booking.save
          flash[:danger] = "You have successfully booked the workshop!"
          redirect_to root_path
        else
          
          redirect_to root_path
        end
      else
        flash[:danger] = "You have successfully booked the workshop!"
        puts 'Unhandled event type: #{event.type}'
      end
    end

  private

    def booking_params
      params.require(:booking).permit(:no_of_tickets).merge(workshop_id: params[:booking][:workshop_id])
    end
    
end
