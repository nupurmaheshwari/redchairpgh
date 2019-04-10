FactoryBot.define do
  
  factory :mentee do
    is_active true
    current_role "Architect"
    mentor_role "Nurturer"
    skill_1 "Knowledge of career field"
    skill_2 "Expanded social support network"
    skill_3 "Increased self-confidence"
    years_in_field 13
    lead_team true
    mentor_gender "Female"
    comm_frequency "Biweekly"
    bio "hi"
    in_five_years "hello"
  end
  
  factory :mentor do
    is_active true
    current_role "Architect"
    years_in_field 12
    years_in_lead 12
    gender "Female"
    comm_frequency "Biweekly"
    bio "hi"
    motivation "motivated"
    specialized_skills "Increased self-confidence"
    mentor_roles "Nurturer"
  end

  factory :mentorship do
    association :mentee     # don't have to put the word association in front, but I think it helps...
    association :mentor
    match_score 100
    is_active true
    mentee_approved true
    mentor_approved true
  end

end