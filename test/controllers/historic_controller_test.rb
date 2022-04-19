require "test_helper"

class HistoricControllerTest < ActionDispatch::IntegrationTest
  test "should get write" do
    get historic_write_url
    assert_response :success
  end

  test "should get read" do
    get historic_read_url
    assert_response :success
  end
end
