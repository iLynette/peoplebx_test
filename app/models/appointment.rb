class Appointment < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :duration, presence: true
  validates :location, presence: true
end
