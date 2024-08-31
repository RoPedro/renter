require "test_helper"

class ManufacturerTest < ActiveSupport::TestCase
  def setup
    @manufacturer = manufacturers(:one)
  end

  test "should not save manufacturer without a name" do
    dummyManufacturer = Manufacturer.new(name: nil)
    assert_not dummyManufacturer.save, "Saved manufacturer without a name"
  end

  test "should not save manufacturer with the same name" do
    dummyManufacturer = Car.new(name: @manufacturer.name) 
    assert_not dummyManufacturer.save, "Saved manufacturer with the same name"
  end

  test "valid manufacturer" do
    assert @manufacturer.valid?
  end
end

# Notes: assert_not is the same as saying that this should not happen