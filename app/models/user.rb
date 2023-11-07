class User < ApplicationRecord
  rolify
  has_many :bookings
	has_many :Workshops, through: :bookings 

  

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
end
