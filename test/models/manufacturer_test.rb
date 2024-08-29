require "test_helper"

class ManufacturerTest < ActiveSupport::TestCase
  def setup
    @dummyManufacturer = Manufacturer.create(name: "Manufacturer")
  end

  test "should not save manufacturer without a name" do
    dummyManufacturer2 = Manufacturer.new(name: nil)
    assert_not dummyManufacturer2.save
  end

  test "should not save manufacturer with the same name" do
    dummyManufacturer3 = Car.new(name: @dummyManufacturer.name) 
    assert_not dummyManufacturer3.save, "Saved the car with the same name"
  end

  test "valid manufacturer" do
    dummyManufacturer4 = Manufacturer.new(name: "Plymouth", email: "plymouth@support.com")
    assert dummyManufacturer4.valid?
  end
end

# Notes: assert_not is the same as saying that this should not happen