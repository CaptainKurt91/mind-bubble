require "test_helper"

class CategoryFilesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get category_files_new_url
    assert_response :success
  end

  test "should get createshow" do
    get category_files_createshow_url
    assert_response :success
  end
end
