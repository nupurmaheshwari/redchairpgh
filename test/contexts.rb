# require needed files
require './test/sets/mentors'
require './test/sets/mentees'

module Contexts
  # explicitly include all sets of contexts used for testing 
  include Contexts::Mentors
  include Contexts::Mentees
  
  
  def create_all
    create_mentees
    puts "Built mentees"
    create_mentors
    puts "Built mentors"
  end
  
end