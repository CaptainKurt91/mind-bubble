require "test_helper"

class CategoryChecklistsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get category_checklists_new_url
    assert_response :success
  end

  test "should get createshow" do
    get category_checklists_createshow_url
    assert_response :success
  end
end
