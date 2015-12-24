class Trippy_methods

	def start_time
		@start = Time.now
	end

	def end_time
		time_end = Time.now - @start
		time_in_min = time_end / 60
	end

	def start_with_amount(hits)
	
	@acid_amount = 0
		if hits <= 2
			@acid_amount += hits
		else @acid_amount += 1 
		end
	end

	def start_acid_amount
		"You Started off with taking #{@acid_amount} hits of acid....Enjoy"
	end
	
	def greedy_ass(hits)
		if hits <= 3
			["Damn man don't be greedy...Ill give you 1 hit for now.", "Don't Worry you will get more as time progresses"].join("<br>")
		end
	end
	
	def total_hits_taken
		"You now have taken #{@acid_amount} hits."
	end
	
	def here_you_go(name)
		"Here you go #{name} enjoy"
	end
	
			
	def increase_high(hits)

	"How Many hits do you want man?"

		if hits <= 6
			greedy_ass
			@acid_amount += 1
		else here_you_go(name)
			@acid_amount += hits
			total_hits_taken
		end
	end

	def lose_buzz(come_down)
		"You buzz has wore off by  #{come_down} hits "
			@acid_amount -= come_down
		left_in_system
	end

	
	def left_in_system
		"This is how much your have left in your system #{@acid_amount}"
	end
	
	
	













end

