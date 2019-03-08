require 'test_helper'

class ResumesControllerTest < ActionDispatch::IntegrationTest
  
    test "should get index" do
    get :index
    assert_equal "index", @controller.action_name
    assert_response :success
    assert_not_empty assigns(:resume)
    assert_match 'Resumes', @response.body
  end

  test "should get new" do
    get resumes_new_url
    assert_response :success
  end

  test "should get create" do
    get resumes_create_url
    assert_response :success
  end

  test "should get destroy" do
    get resumes_destroy_url
    assert_response :success
  end

end
