# frozen_string_literal: true

class AddAppointmentDurationOnUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :appointment_duration, :integer
  end
end
