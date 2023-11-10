class Admin::DashboardController < ApplicationController
  def index
    @workshop_count = Workshop.count
    @upcoming_workshop_count = Workshop.upcoming_workshops.count
    @past_workshop_count = Workshop.past_workshops.count
    @booking_count = Booking.count
    # @revenue_earned = Booking.pluck()
    @users_count = User.count
  end
end