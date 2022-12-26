class BookingsController < ApplicationController
    before_action :set_booking, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!
  
    def index
      @bookings = current_user.bookings
    end
  
    def show
    end

    def new
      @booking = Booking.new
      @appointment = Appointment.find(params[:appointment_id])
      @duration_options = [15, 30, 45, 60]
    end
  
    def edit
    end
  
    def create
      @booking = current_user.bookings.build(booking_params)
  
      if @booking.save
        redirect_to @booking, notice: 'Booking was successfully created.'
      else
        render :new
      end
    end
  
    def update
      if @booking.update(booking_params)
        redirect_to @booking, notice: 'Booking was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @booking.destroy
      redirect_to bookings_url, notice: 'Booking was successfully destroyed.'
    end
  
    private
      def set_booking
        @booking = current_user.bookings.find(params[:id])
      end
  
      def booking_params
        params.require(:booking).permit(:start_time, :end_time, :appointment_id)
      end
  end
  