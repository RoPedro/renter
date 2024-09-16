require "test_helper"

class OrderTest < ActiveSupport::TestCase
  def setup
    @valid_order = orders(:one)
    @unavailable_order = orders(:three)
  end

  test 'shouold save valid order' do
    assert @valid_order.save, 'order not saved even though was valid'
  end
  test 'should not save order if rental is unavailable' do
    assert_not @unavailable_order.save, 'order saved even though rental was unavailable'
    assert_includes @unavailable_order.errors[:rental_car], "must be available to save"
  end

end
