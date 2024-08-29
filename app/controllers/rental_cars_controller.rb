class RentalCarsController < ApplicationController
  def index
    @rental_cars = RentalCar.all
  end

  def show
    @rental_car = RentalCar.find(params[:id])
  end

  def new
    @car = Car.find(params[:car_id])
    @rental_car = RentalCar.new(car: @car)
  end

  def create
    @rental_car = RentalCar.new(rental_car_params)
    if @rental_car.save
      redirect_to @rental_car, notice: 'Rental car was successfully created.'
    else
      render :new
    end
  end

  private
    def rental_car_params
      params.require(:rental_car).permit(:license_plate, :car_id)
    end
end
