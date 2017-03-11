require 'test_helper'

class RolesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @role = roles(:one)
  end

  test "should get index" do
    get roles_url
    assert_response :success
  end

  test "should get new" do
    get new_role_url
    assert_response :success
  end

  test "should create role" do
    assert_difference('Role.count') do
      post roles_url, params: { role: { city: @role.city, company_id: @role.company_id, description: @role.description, employment_time: @role.employment_time, employment_type: @role.employment_type, hiring_manager_id: @role.hiring_manager_id, max: @role.max, min_rate: @role.min_rate, name: @role.name, sponsors_visa: @role.sponsors_visa, state: @role.state, travel_type: @role.travel_type } }
    end

    assert_redirected_to role_url(Role.last)
  end

  test "should show role" do
    get role_url(@role)
    assert_response :success
  end

  test "should get edit" do
    get edit_role_url(@role)
    assert_response :success
  end

  test "should update role" do
    patch role_url(@role), params: { role: { city: @role.city, company_id: @role.company_id, description: @role.description, employment_time: @role.employment_time, employment_type: @role.employment_type, hiring_manager_id: @role.hiring_manager_id, max: @role.max, min_rate: @role.min_rate, name: @role.name, sponsors_visa: @role.sponsors_visa, state: @role.state, travel_type: @role.travel_type } }
    assert_redirected_to role_url(@role)
  end

  test "should destroy role" do
    assert_difference('Role.count', -1) do
      delete role_url(@role)
    end

    assert_redirected_to roles_url
  end
end
