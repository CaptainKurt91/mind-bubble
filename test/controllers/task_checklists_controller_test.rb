require "test_helper"

class TaskChecklistsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get task_checklists_new_url
    assert_response :success
  end

  test "should get create" do
    get task_checklists_create_url
    assert_response :success
  end

  test "should get show" do
    get task_checklists_show_url
    assert_response :success
  end
end
