class Mentorship < ApplicationRecord
    belongs_to :mentor 
    belongs_to :mentee 
    #validate :valid_mentorship?
    
    scope :for_mentee, ->(mentee_id) { where('mentee_id = ?', mentee_id) } 
    scope :for_mentor, ->(mentor_id) { where('mentor_id = ?', mentor_id) } 
    scope :find_mentorship, ->(mentor_id, mentee_id) { where('mentor_id = ? AND mentee_id = ?', mentor_id, mentee_id) }
    
    def valid_mentorship? 
        mentor.user_id != mentee.user_id 
    end
    
    def accept
        update(status: 'accepted')
    end
    
    def find_mentor
        Mentor.find(self.mentor_id)
    end 
    
    def find_mentee 
        Mentee.find(self.mentee_id)
    end 
end
