require "test_helper"

class RentalCarTest < ActiveSupport::TestCase
  def setup
    @dummyRental1 = RentalCar.new(license_plate: "AAA1B22") 
  end

  test "should not save rental without a license plate" do
    rental = RentalCar.new(license_plate: nil)
    assert_not rental.save, "Saved the rental without a license plate"
  end

  test "should not save duplicate license plates" do
    @dummyRental2 = RentalCar.new(license_plate: "AAA1B22")
    assert_not @dummyRental2.save, "Saved the car with the same license plate"
  end
end

# Notes: assert_not is the same as saying that this should not happen