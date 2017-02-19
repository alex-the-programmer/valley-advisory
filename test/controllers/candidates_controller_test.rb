require 'test_helper'

class CandidatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @candidate = candidates(:one)
  end

  test "should get index" do
    get candidates_url
    assert_response :success
  end

  test "should get new" do
    get new_candidate_url
    assert_response :success
  end

  test "should create candidate" do
    assert_difference('Candidate.count') do
      post candidates_url, params: { candidate: { current_company: @candidate.current_company, desired_position: @candidate.desired_position, email: @candidate.email, first_name: @candidate.first_name, git_hub_url: @candidate.git_hub_url, last_name: @candidate.last_name, linked_in_url: @candidate.linked_in_url, phone: @candidate.phone, portfolio_url: @candidate.portfolio_url, twitter_url: @candidate.twitter_url, user_id: @candidate.user_id, website_url: @candidate.website_url } }
    end

    assert_redirected_to candidate_url(Candidate.last)
  end

  test "should show candidate" do
    get candidate_url(@candidate)
    assert_response :success
  end

  test "should get edit" do
    get edit_candidate_url(@candidate)
    assert_response :success
  end

  test "should update candidate" do
    patch candidate_url(@candidate), params: { candidate: { current_company: @candidate.current_company, desired_position: @candidate.desired_position, email: @candidate.email, first_name: @candidate.first_name, git_hub_url: @candidate.git_hub_url, last_name: @candidate.last_name, linked_in_url: @candidate.linked_in_url, phone: @candidate.phone, portfolio_url: @candidate.portfolio_url, twitter_url: @candidate.twitter_url, user_id: @candidate.user_id, website_url: @candidate.website_url } }
    assert_redirected_to candidate_url(@candidate)
  end

  test "should destroy candidate" do
    assert_difference('Candidate.count', -1) do
      delete candidate_url(@candidate)
    end

    assert_redirected_to candidates_url
  end
end
