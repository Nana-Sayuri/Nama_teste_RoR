require 'test_helper'

class SalesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sale = sales(:one)
  end

  test "should get index" do
    get sales_url
    assert_response :success
  end

  test "should get new" do
    get sales_url
    assert_response :success
  end

  test "should create sale" do
    file = fixture_file_upload('dados.txt', 'text/plain')
    assert_difference('Sale.count', 4) do
      post "/sales", params: { :sale => {:process_file => file } }
    end
    assert_response :redirect
  end

  test "should show sale" do
    get sales_url(@sale)
    assert_response :success
  end

  test "should destroy sale" do
    assert_difference("Sale.count", -1) do
      delete sale_url(@sale)
    end
    assert_redirected_to sales_path
  end
end
