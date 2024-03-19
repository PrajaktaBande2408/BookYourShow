class ShowtimesController < ApplicationController
  def index
    @showtimes = Showtime.includes(:movie).all
  end

  def show
    @showtime = Showtime.find(params[:id])
    @available_seats = @showtime.available_seats
  end

  def book_ticket
    @showtime = Showtime.find(params[:id])
    if @showtime.available_seats > 0
      seat_number = @showtime.bookings.maximum(:seat_number).to_i + 1
      @showtime.bookings.create(seat_number: seat_number, user_name: params[:user_name])
      @showtime.update(available_seats: @showtime.available_seats - 1)
      flash[:success] = "Ticket booked successfully! Seat number: #{seat_number}"
    else
      flash[:error] = "Sorry, no seats available for this show."
    end
    redirect_to showtime_path(@showtime)
  end

  def cancel_ticket
    @booking = Booking.find(params[:booking_id])
    @showtime = @booking.showtime
    @booking.destroy
    @showtime.update(available_seats: @showtime.available_seats + 1)
    flash[:success] = "Ticket canceled successfully!"
    redirect_to showtime_path(@showtime)
  end
end
