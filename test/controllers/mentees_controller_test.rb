require 'test_helper'

class MenteesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mentee = mentees(:one)
  end

  test "should get index" do
    get mentees_url
    assert_response :success
  end

  test "should get new" do
    get new_mentee_url
    assert_response :success
  end

  test "should create mentee" do
    assert_difference('Mentee.count') do
      post mentees_url, params: { mentee: { bio: @mentee.bio, comm_frequency: @mentee.comm_frequency, current_role: @mentee.current_role, in_five_years: @mentee.in_five_years, is_active: @mentee.is_active, lead_team: @mentee.lead_team, mentor_gender: @mentee.mentor_gender, mentor_role: @mentee.mentor_role, skill_1: @mentee.skill_1, skill_2: @mentee.skill_2, skill_3: @mentee.skill_3, years_in_field: @mentee.years_in_field } }
    end

    assert_redirected_to mentee_url(Mentee.last)
  end

  test "should show mentee" do
    get mentee_url(@mentee)
    assert_response :success
  end

  test "should get edit" do
    get edit_mentee_url(@mentee)
    assert_response :success
  end

  test "should update mentee" do
    patch mentee_url(@mentee), params: { mentee: { bio: @mentee.bio, comm_frequency: @mentee.comm_frequency, current_role: @mentee.current_role, in_five_years: @mentee.in_five_years, is_active: @mentee.is_active, lead_team: @mentee.lead_team, mentor_gender: @mentee.mentor_gender, mentor_role: @mentee.mentor_role, skill_1: @mentee.skill_1, skill_2: @mentee.skill_2, skill_3: @mentee.skill_3, years_in_field: @mentee.years_in_field } }
    assert_redirected_to mentee_url(@mentee)
  end

  test "should destroy mentee" do
    assert_difference('Mentee.count', -1) do
      delete mentee_url(@mentee)
    end

    assert_redirected_to mentees_url
  end
end
