class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @appointments = current_user.appointments
  end

  def show
  end

  def new
    @appointment = Appointment.new
  end

  def edit
  end

    def available_slots
      appointment = Appointment.find(params[:appointment_id])
     
      @date = Date.parse(params[:date])
      @appointments = Appointment.where(start_time: @date.beginning_of_day..@date.end_of_day)
    end

  def create
    @appointment = current_user.appointments.build(appointment_params)

    if @appointment.save!
      redirect_to appointments_path, notice: 'Appointment was successfully created.'
    else
      render :new
    end
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to @appointment, notice: 'Appointment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @appointment.destroy
    redirect_to appointments_url, notice: 'Appointment was successfully destroyed.'
  end

  private
    def set_appointment
      @appointment = current_user.appointments.find(params[:id])
    end

    def appointment_params
      params.require(:appointment).permit(:start_time, :end_time, :duration, :location, :date).with_defaults(
        user: current_user,
        duration: current_user.appointment_duration
      )
    end
end