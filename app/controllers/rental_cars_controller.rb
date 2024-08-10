class RentalCarsController < ApplicationController
  def index
    @rental_cars = RentalCar.all
  end

  def new
    @rental_car = RentalCar.new
  end

  def create
    @rental_car = RentalCar.new(rental_car_params)

    if @rental_car.save
      redirect_to @rental_car
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def rental_car_params
      params.require(:rental_car).permit(:license_plate, :car_id)
    end
end
