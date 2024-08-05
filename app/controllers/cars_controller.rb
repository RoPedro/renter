class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def show
    @car = Car.includes(:manufacturer).find(params[:id])
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)

    if @car.save
      redirect_to @car
    else
      render :new, status: :unprocessable_entity
    end
  end



  private
    def car_params
      params.require(:car).permit(:name, :manufacturer_id, :engine, :transmission, :horsepower, :released_at)
    end
end
