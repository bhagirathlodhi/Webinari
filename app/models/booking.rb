class Booking < ApplicationRecord
  belongs_to :customer
  belongs_to :workshop

  after_create :update_workshop_seat_count

  def update_workshop_seat_count
    workshop.update(remaining_seat: workshop.total_seat - no_if_tickets)
  end
end
