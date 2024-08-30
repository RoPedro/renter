require "test_helper"

class ManufacturersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get manufacturers_path
    assert_response :success
  end
  
  test "manufacturer_count_all" do
    assert_equal 2, Manufacturer.all.count
  end

  test "manufacturer_count_active" do
    assert_equal 1, Manufacturer.where(is_archived: false).count
  end

  test "manufacturer_count_inactive" do
    assert_equal 1, Manufacturer.where(is_archived: true).count
  end
end
