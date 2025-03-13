class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @bookings = Booking.where(user: current_user, status: "pending")
    @heros = Hero.where(user: current_user)
  end
end
