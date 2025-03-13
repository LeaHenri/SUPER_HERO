class HerosController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @heros = Hero.all
    @heros = Hero.where(name: params[:name]) if params[:name].present?
    @heros = Hero.where(power: params[:power]) if params[:power].present?
  end

  def show
    @hero = Hero.find(params[:id])
    @booking = Booking.new
  end

  def new
    @hero = Hero.new
  end

  def create
    @hero = Hero.new(hero_params)
    @hero.user = current_user
    if @hero.save
      redirect_to dashboard_path, notice: "the super-hero was created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

private

  def hero_params
    params.require(:hero).permit(:name, :power, :description, :photo)
  end
end
