class BookingsController < ApplicationController
  def create
    @workshop = Workshop.find(params[:booking][:workshop_id])
    @booking = current_user.bookings.new(booking_params)
    
    if @booking.save
      redirect_to @workshop
    else
      flash[:error] = "Booking failed. Please try again."
      redirect_to @workshop
    end
  end

  def all_booking
    @bookings = current_user.bookings.all
  end

  private

  def booking_params
    params.require(:booking).permit(:no_of_tickets).merge(workshop_id: params[:booking][:workshop_id])
  end
    
end
