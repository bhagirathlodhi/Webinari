class RefundsController < ApplicationController
  before_action :set_refund_with_parents, only: %i[edit update refund_acceptance]

  def new 
    @refund = Refund.new 
  end

  def edit 
   
  end
  
  def create 
    booking = Booking.find_by(order_number: params[:refund][:order_number])
    
    if booking.present?
      if booking.is_refundable?
        @refund = Refund.create(
          user_id: booking.user_id,
          booking_id: booking.id,
          state: "accepted"
          )
        redirect_to edit_refund_path(@refund), notice: 'Your booking reduest is valid. please fill other details  to process your refund request'
      else
        redirect_to new_refund_path, alert: "You are requesting refund for past workshop that is not allowed "
      end
      else
        redirect_to new_refund_path, alert: " You Provided Invalid Booking ID #{params[:refund][:order_number]}. we not founded with this booking id .. Please Provide Valid Booking ID "
      end

    end
    
    def update
    end

    def refund_acceptance
    end

    private

      def set_refund_with_parents
        debugger
        @refund = Refund.find(params[:id])
        @booking = @refund.booking
        @workshop = @booking.workshop
        
      end

end