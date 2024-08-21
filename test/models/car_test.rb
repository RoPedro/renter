require "test_helper"

class CarTest < ActiveSupport::TestCase
  def setup
    @dummyCar1 = Car.create(name: "Car1") 
  end

  test "should not save car without a name" do
    car = Car.new(name: nil)
    assert_not car.save, "Saved the car without a name"
  end

  test "should not save car with the same name" do
    dummyCar2 = Car.new(name: @dummyCar1.name) 
    assert_not dummyCar2.save, "Saved the car with the same name"
  end
end

# Notes: assert_not is the same as saying that this should not happen
