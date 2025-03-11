class BookingsController < ApplicationController
  def create
    @hero = Hero.find(params[:hero_id])
    @booking = Booking.new(booking_params)
    @booking.hero = @hero
    @booking.user = current_user
    if @booking.save
      redirect_to hero_path(@hero)
    else
      render "heros/show", status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end
end
