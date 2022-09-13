require "test_helper"

class CategoryChecklistItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get category_checklist_items_new_url
    assert_response :success
  end

  test "should get create" do
    get category_checklist_items_create_url
    assert_response :success
  end
end
