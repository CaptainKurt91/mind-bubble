require "test_helper"

class TaskNotesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get task_notes_new_url
    assert_response :success
  end

  test "should get create" do
    get task_notes_create_url
    assert_response :success
  end

  test "should get show" do
    get task_notes_show_url
    assert_response :success
  end
end
