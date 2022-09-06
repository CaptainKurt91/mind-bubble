require "test_helper"

class ComponentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get components_new_url
    assert_response :success
  end

  test "should get create" do
    get components_create_url
    assert_response :success
  end
end
