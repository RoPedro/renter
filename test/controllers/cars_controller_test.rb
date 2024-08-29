require "test_helper"

class CarsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cars_path
    assert_response :success
  end

  test "cars_count_all" do
    assert_equal 3, Car.all.count
  end

  test "cars_count_sub_00s" do
    assert_equal 1, Car.where('released_at < ?', '2000-01-01').count
  end

  test "cars_count_without_rentals_available" do
    assert_equal 1, Car.left_joins(:rental_cars).where('rental_cars.id IS NULL').count
  end
end
