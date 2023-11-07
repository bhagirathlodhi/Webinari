class Workshop < ApplicationRecord
	extend FriendlyId
  friendly_id :name, use: :slugged
	
	has_many :bookings, dependent: :destroy
	has_many :users, through: :bookings

	after_create :update_workshop_seat_count


	validates :name, :descrition, presence: true
	validates :start_date, :end_date, :start_time, :end_time, presence: true
	validates :total_seat, :registration_fee, presence: true,
	numericality: true
	validates :end_date, comparison: { greater_than: :start_date, message: " can not be before start date "}

	scope :upcoming_workshops, ->{ where('start_date >= ?', Date.today) }
	scope :past_workshops, ->{ where( 'end_date <= ?', Date.today ) }

	def total_duration
	  "From #{start_date} to #{end_date}"
	end

	def daily_workshop_hours
		"#{((start_time.to_time - end_time.to_time)/1.hours).abs} hours"
	end

	def daily_duration
		"Everyday #{start_time.strftime("%H:%M")} to #{end_time.strftime("%H:%M")} (#{daily_workshop_hours})"
	end

	def update_workshop_seat_count
		Workshop.last.update(remaining_seat: total_seat)
	end

	def workshop_taken
		start_date > Date.today
	end
end
