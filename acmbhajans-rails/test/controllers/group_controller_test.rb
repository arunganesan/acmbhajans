require 'test_helper'

class GroupControllerTest < ActionDispatch::IntegrationTest
  test "should get attended" do
    get group_attended_url
    assert_response :success
  end

  test "should get bhajans" do
    get group_bhajans_url
    assert_response :success
  end

end
