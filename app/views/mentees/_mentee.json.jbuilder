json.extract! mentee, :id, :is_active, :current_role, :mentor_role, :skill_1, :skill_2, :skill_3, :years_in_field, :lead_team, :mentor_gender, :comm_frequency, :bio, :in_five_years, :created_at, :updated_at
json.url mentee_url(mentee, format: :json)
