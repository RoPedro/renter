class RentalCarsController < ApplicationController
  def index
    @rental_cars = RentalCar.all
  end
end
