class Mentee < ApplicationRecord
    
	# Relationships
	has_many :mentorships
	
	## ADD SCOPE: MENTORS_LIST (through mentorships)
	
	ROLE = [['Nurturer', 'Nurturer'],['Colleague', 'Colleague'],['Sounding board', 'Sounding board'], ['Motivator','Motivator']]
	IMPACT = [['Knowledge of professional etiquette and standards of personal presentation', 'Knowledge of professional etiquette and standards of personal presentation'],['Knowledge of career field', 'Knowledge of career field'],['Expanded social support network', 'Expanded social support network'], ['Increased self-confidence','Increased self-confidence'],['Improved communication skills','Improved communication skills'],['Increased professional network','Increased professional network'], ['Improved supervisory/leadership Skills','Increased self-confidence'],['Increased self-confidence','Increased self-confidence'],['Increased self-confidence','Increased self-confidence'],['Increased self-confidence','Increased self-confidence'],['Increased self-confidence','Increased self-confidence']]
	COMMUNICATION_FREQ = [['Biweekly', 'Biweekly'],['Monthly', 'Monthly'],['Bimonthly', 'Bimonthly'], ['Quarterly','Quarterly'],  ['No preference','No preference']]
	GENDER = [['Male', 'Male'],['Female', 'Female'],['Non-binary', 'Non-binary'], ['No preference','No preference']]
	EXPERIENCE = [['1-5', '1-5'],['5-10', '5-10'],['15+', '15+'], ['10-15','10-15']]
	CURR_ROLE = [['Architect', 'Architect'],['Business Analyst', 'Business Analyst'],['Data Analyst', 'Data Analyst'], ['QA/tester','QA/tester'],['Sales', 'Sales'],['UX/UI', 'UX/UI'],['Other', 'Other'], ]

	
	def matches 
		Match.new(self) 
	end 
	
end