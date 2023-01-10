# frozen_string_literal: true

class Api::AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[show edit update destroy]
  
  def index
    user = User.first
    @appointments = user.appointments

    render json: @appointments
  end

  def show
    @appointment = Appointment.find(params[:id])
    render json: @appointment
  end

  def new
    @appointment = Appointment.new
  end

  def edit; end

  def create
    user = User.first
    @appointment = user.appointments.build(appointment_params)

    if @appointment.save!
      render json: @appointment, status: :created, location: @appointment
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  def update
    @appointment = Appointment.find(params[:id])

    if @appointment.update(appointment_params)
      render json: @appointment
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    render json: { message: 'Appointment deleted succesfully.' } if @appointment.destroy
  end

  private

  def set_appointment
    user = User.first
    @appointment = user.appointments.find(params[:id])
  end

  def appointment_params
    user = User.first
    params.require(:appointment).permit(:start_time, :duration, :location, :date).with_defaults(
      duration: user.appointment_duration
    )
  end
end
