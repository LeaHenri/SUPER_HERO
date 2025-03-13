class HerosController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @heros = Hero.all
    @heros = @heros.search_by_name_and_power(params[:query]) if params[:query].present?
    # @heros = @heros.where(name: params[:name]) if params[:name].present?
    # @heros = @heros.where(power: params[:power]) if params[:power].present?
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
    if @hero.save
      redirect_to hero_path(@hero), notice: "the super-hero was created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

private

  def hero_params
    params.require(:hero).permit(:name, :power, :description)
  end
end
