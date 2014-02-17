require 'test_helper'

class NewsReaderControllerTest < ActionController::TestCase
  test "should get news" do
    get :news
    assert_response :success
  end

end
