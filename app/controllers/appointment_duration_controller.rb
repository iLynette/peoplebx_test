class AppointmentDurationController < ApplicationController
    def create
      current_user.update!(appointment_duration: params[:duration])
  
      redirect_to '/book/*email', notice: "Duration was updated"
    end
  end
