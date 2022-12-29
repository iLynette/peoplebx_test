class AvailableSlotsController < ApplicationController

    def show          
      @date = Date.today
  
      @available_slots = Appointment.slots(current_user).map do |slot_time|
        {
          time: slot_time,
          active: Appointment.where(start_time: slot_time).blank?
        }
      end
  
    end
  end
