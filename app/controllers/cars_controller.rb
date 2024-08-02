class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def show
    @car = Car.includes(:manufacturer).find(params[:id])
  end
end
