require 'test_helper'

class BeadsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get beads_new_url
    assert_response :success
  end

end
