require "test_helper"

class ManufacturerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "valid manufacturer" do
    manufacturer = Manufacturer.new(name: "Plymouth", email: "plymouth@support.com")
    assert manufacturer.valid?
  end
end
