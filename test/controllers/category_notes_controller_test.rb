require "test_helper"

class CategoryNotesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get category_notes_new_url
    assert_response :success
  end

  test "should get createshow" do
    get category_notes_createshow_url
    assert_response :success
  end
end
