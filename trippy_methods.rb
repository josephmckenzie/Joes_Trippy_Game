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
		if hits >= 3
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
	
	
	def put_in_stash(increase_stash)

	@stash = [] unless @stash
	@stash << increase_stash
		just_added(increase_stash)
	end

	def just_added(increase_stash)
		"You just added #{increase_stash} to your stash"
	end
	
	
	def whats_in_stash 
		"You now have the following items in your stash #{@stash}"
	end
	
	def delete_from_stash(decrease_stash)

		if @stash.include?(decrease_stash)
		   @stash.delete(decrease_stash)
		end
			whats_in_stash
	end

	def used_from_stash(decrease_stash)
		"You used #{decrease_stash} from your stash"
	end
	
	
	def not_in_stash
		'Hey Man that item is not in your stash, what are you high?!!'
	end
	
	def start_with_drinks(booze)
	
	@drink_amount = 0
		if booze <= 3
			@drink_amount += booze
		else @drink_amount += 1 
		end
	end

	def start_drink_amount
		"You Started off with taking #{@drink_amount} drinks. Be careful how much you drink."
	end
	
	def greedy_ass_booze(booze)
		if booze >= 3
			["Damn man don't be greedy...Ill give 1 drink for now.", "Don't Worry we will get more"].join("<br>")
		end
	end
	
	def total_drinks_taken
		"You now have taken #{@drink_amount} drinks."
	end
	
	def here_you_go(name)
		"Here you go #{name} enjoy"
	end
			
	def increase_drink(booze)

	"How Many drinks do you want man?"

		if booze <= 4
			greedy_ass
			@drink_amount += 1
		else here_you_go(name)
			@drink_amount += booze
			total_drinks_taken
		end
	end

	def lose_drinks(booze)
		"You buzz has wore off by  #{booze} drinks "
			@drink_amount -= booze
		booze_left_in_system
	end
	
	def booze_left_in_system
		"This is how much your have left in your system #{@drink_amount}"
	end

	
	def total_shit_consumed
		"You have taken #{@acid_amount} hits of acid & drank #{drink_amount} drinks of booze."
	end
	








end

