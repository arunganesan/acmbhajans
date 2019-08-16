require 'test_helper'

class IndividualControllerTest < ActionDispatch::IntegrationTest
  test "should get graduated" do
    get individual_graduated_url
    assert_response :success
  end

  test "should get request" do
    get individual_request_url
    assert_response :success
  end

end
