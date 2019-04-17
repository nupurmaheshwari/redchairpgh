class Mentorship < ApplicationRecord
    belongs_to :mentor 
    belongs_to :mentee 
    validate :valid_mentorship?
    
    scope :for_mentee, ->(mentee_id) { where('mentee_id = ?', mentee_id) } 
    scope :for_mentor, ->(mentor_id) { where('mentor_id = ?', mentor_id) } 
    
    def valid_mentorship? 
        mentor.user_id != mentee.user_id 
    end
    
end
