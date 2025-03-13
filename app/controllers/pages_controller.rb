class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @bookings = Booking.where(user: current_user, status: "pending")
    @heros = Hero.where(user: current_user)
    @bookings_owner = []
    @heros.each do |hero|
      if !Booking.where(hero: hero).empty?
        @bookings_owner << Booking.where(hero: hero)
      end
    end
    @bookings_owner.flatten!
  end
end
