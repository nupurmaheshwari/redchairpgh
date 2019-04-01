class Mentorship < ApplicationRecord
    
  # Relationships
  belongs_to :users 
  
  # Validations
  validates_presence_of :user1
  validates_presence_of :user2
  
end