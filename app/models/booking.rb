class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :workshop

  after_create :update_workshop_seat_count

  def update_workshop_seat_count
    self.workshop.update(remaining_seat: workshop.remaining_seat - no_of_tickets)
  end
end
