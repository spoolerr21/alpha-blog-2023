require "test_helper"

class TabulaTestControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tabula_test_index_url
    assert_response :success
  end
end
