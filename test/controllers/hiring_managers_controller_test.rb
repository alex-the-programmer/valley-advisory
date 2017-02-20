require 'test_helper'

class HiringManagersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hiring_manager = hiring_managers(:one)
  end

  test "should get index" do
    get hiring_managers_url
    assert_response :success
  end

  test "should get new" do
    get new_hiring_manager_url
    assert_response :success
  end

  test "should create hiring_manager" do
    assert_difference('HiringManager.count') do
      post hiring_managers_url, params: { hiring_manager: { company_id: @hiring_manager.company_id, position: @hiring_manager.position, user_id: @hiring_manager.user_id } }
    end

    assert_redirected_to hiring_manager_url(HiringManager.last)
  end

  test "should show hiring_manager" do
    get hiring_manager_url(@hiring_manager)
    assert_response :success
  end

  test "should get edit" do
    get edit_hiring_manager_url(@hiring_manager)
    assert_response :success
  end

  test "should update hiring_manager" do
    patch hiring_manager_url(@hiring_manager), params: { hiring_manager: { company_id: @hiring_manager.company_id, position: @hiring_manager.position, user_id: @hiring_manager.user_id } }
    assert_redirected_to hiring_manager_url(@hiring_manager)
  end

  test "should destroy hiring_manager" do
    assert_difference('HiringManager.count', -1) do
      delete hiring_manager_url(@hiring_manager)
    end

    assert_redirected_to hiring_managers_url
  end
end
