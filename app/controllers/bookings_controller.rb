class BookingsController < ApplicationController
  def create
    @hero = Hero.find(params[:hero_id])
    @booking = Booking.new(booking_params)
    @booking.hero = @hero
    @booking.user = current_user
    @booking.status = "pending"
    if @booking.save
      redirect_to dashboard_path
    else
      render "heros/show", status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
