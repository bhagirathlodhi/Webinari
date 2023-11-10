class BookingsMailer < ActionMailer::Base
  default :from => 'no-reply@gmail.com'

  def success_booking(booking)
    @booking = booking
    @workshop = @booking.workshop
    mail to: "abc@gmail.com", subject: "Booking Confirmation for #{@workshop.name}"
  end

end