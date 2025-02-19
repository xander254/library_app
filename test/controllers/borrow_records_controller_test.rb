require "test_helper"

class BorrowRecordsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get borrow_records_create_url
    assert_response :success
  end

  test "should get return" do
    get borrow_records_return_url
    assert_response :success
  end
end
