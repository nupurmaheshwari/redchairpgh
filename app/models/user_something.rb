class User < ApplicationRecord
  
  # Use built-in rails support for password protection
  has_secure_password
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  
  # Relationships
  has_many :mentorships
  
  # Validations
  validates_presence_of :first_name, :last_name, :email
  validates_presence_of :linkedin_link 
  validates_presence_of :password, :on => :create 
  validates_presence_of :password_confirmation, :on => :create 
  validates_confirmation_of :password, message: "does not match"
  validates_length_of :password, :minimum => 4, message: "must be at least 4 characters long", :allow_blank => true
  
  # Scopes
  scope :mentors, -> { where('active = ?', true) }
  scope :mentee, -> { where('caption') }
  
  
  ## Other Methods 
  
  # login by username
  def self.authenticate(username, password)
    find_by_username(username).try(:authenticate, password)
  end
end