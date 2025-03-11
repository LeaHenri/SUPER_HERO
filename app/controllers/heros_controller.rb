class HerosController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @heros = Hero.all
  end

  def show
    @hero = Hero.find(params[:id])
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
