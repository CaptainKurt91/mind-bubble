require "test_helper"

class TaskChecklistItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get task_checklist_items_new_url
    assert_response :success
  end

  test "should get create" do
    get task_checklist_items_create_url
    assert_response :success
  end
end
