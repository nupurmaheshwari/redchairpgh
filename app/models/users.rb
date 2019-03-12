class User < ApplicationRecord
    
  # Relationships
  has_many :mentorships
  
  # Validations
  validates_presence_of :first_name, :last_name, :email
  validates_presence_of :linkedin_link 
  
  # Scopes
  scope :mentors, 			 -> { where('active = ?', true) }
  scope :mentee, -> { where('caption') }
  
end