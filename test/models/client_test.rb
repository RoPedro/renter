require "test_helper"

class ClientTest < ActiveSupport::TestCase
  def setup
    @client = clients(:one)
    @invalidClient = clients(:four)
  end

  test "should not save client without a first name" do
    dummyClient = Client.new(first_name: nil)
    assert_not dummyClient.save, "Saved the client without a first name"
  end

  test "should not save client without a last name" do
    dummyClient = Client.new(last_name: nil)
    assert_not dummyClient.save, "Saved the client without a last name"
  end

  test "should not save client with duplicate email" do
    duplicateClient = Client.new(email: @client.email) 
    assert_not duplicateClient.save, "Saved the client with the same email"
  end

  test "should not save clients that have a invalid name" do
    assert_not @invalidClient.save, "Saved the client with an invalid name"
  end
end
