require 'test_helper'

class MsgControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get msg_new_url
    assert_response :success
  end

  test "should get send" do
    get msg_send_url
    assert_response :success
  end

end
