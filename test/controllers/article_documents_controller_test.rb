require 'test_helper'

class ArticleDocumentsControllerTest < ActionController::TestCase
  test "should get _left" do
    get :_left
    assert_response :success
  end

  test "should get main" do
    get :main
    assert_response :success
  end

  test "should get top" do
    get :top
    assert_response :success
  end

end
