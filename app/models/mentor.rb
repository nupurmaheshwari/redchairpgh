class Mentor < ApplicationRecord
    
	# Relationships
	has_many :mentorships
	
	## ADD SCOPE: MENTEES_LIST 
	#scope :alphabetical, -> { order('name') }
	scope :active,       -> { where(is_active: true) }
	scope :inactive,     -> { where(is_active: false) }
	
	ROLE = [['Nurturer', 'Nurturer'],['Colleague', 'Colleague'],['Sounding board', 'Sounding board'], ['Motivator','Motivator']]
	IMPACT = [['Knowledge of professional etiquette and standards of personal presentation', 'Knowledge of professional etiquette and standards of personal presentation'],['Knowledge of career field', 'Knowledge of career field'],['Expanded social support network', 'Expanded social support network'], ['Increased self-confidence','Increased self-confidence'],['Improved communication skills','Improved communication skills'],['Increased professional network','Increased professional network'], ['Improved supervisory/leadership Skills','Improved supervisory/leadership Skills'],['Career planning/progression & professional development','Career planning/progression & professional development'],['Work\life balance','Work\life balance'],['Negotiation tactics','Negotiation tactics'],['Developing technical skills','Developing technical skills'], ['Entrepreneurship','Entrepreneurship']]
	COMMUNICATION_FREQ = [['Biweekly', 'Biweekly'],['Monthly', 'Monthly'],['Bimonthly', 'Bimonthly'], ['Quarterly','Quarterly'],  ['As needed','As needed']]
	GENDER = [['Female', 'Female'],['Male', 'Male'],['Non-binary', 'Non-binary'], ['Do not wish to disclose','Do not wish to disclose']]
	EXPERIENCE = [['1-5', '1-5'],['5-10', '5-10'],['15+', '15+']]
	BACKGROUND = [['Architect', 'Architect'],['Business Analyst', 'Business Analyst'],['Data Analyst', 'Data Analyst'], ['QA/tester','QA/tester'],['Sales', 'Sales'],['UX/UI', 'UX/UI'],['Developer/Engineer', 'Developer/Engineer'],['Marketing', 'Marketing'],['Project Manager', 'Project Manager'], ['Other', 'Other'] ]
	MENTOR_ROLES = [['Nurturer', 'Nurturer'],['Colleague', 'Colleague'],['Sounding board', 'Sounding board'],['Teacher', 'Teacher'],['Motivator', 'Motivator']]

	def get_requests 
		Mentorship.for_mentor(self.id)
	end
	
	def full_name 
		#user = User.find(self.user_id).first
		#user.first_name + " " + user.last_name 
		self.id
	end
	
	def email 
		#User.find(self.user_id).first.email
		self.id
	end 
end