class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :appointment

  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :start_time_must_be_at_least_15_minutes_in_the_future
end