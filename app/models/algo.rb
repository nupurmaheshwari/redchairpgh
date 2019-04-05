def match(mentee)
	#all mentor options that pass binary questions
	filtered = initial_filter(mentee)
	#create hash table to store mentors and their weighted points
	mentor_points = Hash.new 
	#pass through filtered mentors and associate points with mentors that have skills needed
	#add these mentors to hash table
	filtered.each do |mentor|
		if mentor.specialized_skills.include? mentee.skill_3
			mentor_points[mentor] << 1
		if mentor.specialized_skills.include? mentee.skill_2
			if mentor_points[] == nil
				mentor_points[mentor] << 2
			else
				mentor_points[mentor] += 2
		if mentor.specialized_skills.include? mentee.skill_1
			if mentor_points[] == nil
				mentor_points[mentor] << 3
			else
				mentor_points[mentor] += 3

	#order hash in descending order of number of points per mentor
	mentor_points.sort_by {|key,value| value}.reverse
end


#check all binary questions, and filter mentors down accordingly
def initial_filter(mentee)
	mentor_list = Mentor.all.active
	#create array to hold filtered down mentors
	acceptable = []
	mentor_list.each do |mentor|
		if mentee.gender == 'no preference' || mentee.gender == mentor.gender
			if mentor.mentor_roles.include? mentee.mentor_roles
				if frequency(mentee, mentor) == true
					acceptable.push(mentor)
	return acceptable
end


#check if mentor and mentee communication frequency are compatible
def frequency(mentee, mentor)
	if mentee.comm_frequency == 'no preference' || mentor.comm_frequency == 'no preference' 
		return true
	if mentee.comm_frequency == mentor.comm_frequency
		return true
		#UNFINISHED!!!!!!! (ensure that mentor wants to meet more than mentee)
	if
end

