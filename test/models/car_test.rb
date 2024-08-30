require "test_helper"

class CarTest < ActiveSupport::TestCase
  def setup
    @car = cars(:one) 
  end

  test "should not save car without a name" do
    dummyCar = Car.new(name: nil)
    assert_not dummyCar.save, "Saved the car without a name"
  end

  test "should not save car with the same name" do
    dummyCar = Car.new(name: @car.name) 
    assert_not dummyCar.save, "Saved the car with the same name"
  end
end

# Notes: assert_not is the same as saying that this should not happen
