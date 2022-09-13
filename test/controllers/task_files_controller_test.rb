require "test_helper"

class TaskFilesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get task_files_new_url
    assert_response :success
  end

  test "should get create" do
    get task_files_create_url
    assert_response :success
  end

  test "should get show" do
    get task_files_show_url
    assert_response :success
  end
end
