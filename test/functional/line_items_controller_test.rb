require 'test_helper'

class LineItemsControllerTest < ActionController::TestCase
  test "should get items" do
    get :items
    assert_response :success
  end

end
