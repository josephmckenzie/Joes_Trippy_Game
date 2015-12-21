class Start_messages


	def welcome
		"Welcome to Joe's Games."
	 end
	 
	def name_age
		"Enter your name & age to start."
	 end
	 
	def to_start_jade
		"So you wanna play Jade's Safari Adventure game?"
	end
	
	
	def to_start_joe
		"If you want to play Joe's Trippy Adventure Game"
	end

	def start_joe(name)
		"Great #{name} you are old enough to Play Joe's Trippy Adventure Game."
	end
	
	def start_jade(name)
		"#{name} Chose to play Jade's Safari Adventure Game."
	end
	
	
	def too_young(name)
		"#{name} You are too young to play Joe's Trippy game how about a nice Lepoard adventure game?"
	end
	
	def too_old(name)
		"Hey #{name} Aren't You a little old to play this type of game?"
	end
	
end


