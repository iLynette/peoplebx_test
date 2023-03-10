# frozen_string_literal: true

class Appointment < ApplicationRecord
  OPTIONS = {
    "15": 15,
    "30": 30,
    "45": 45,
    "60": 60,
    "90": 90
  }.freeze

  has_many :bookings, dependent: :destroy
  belongs_to :user
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :location, presence: true

  before_validation do
    self.end_time = start_time + duration.minutes
  end

  def self.slots(user)
    (Date.today.beginning_of_day.to_datetime.to_i..Date.today.end_of_day.to_datetime.to_i).step(user.appointment_duration.minutes).map do
      Time.at(_1)
    end
  end
end
