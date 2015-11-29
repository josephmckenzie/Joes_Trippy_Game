def start_with_amount
	puts "You wanna start with 1 or 2 hits?" 
drugs = $stdin.gets.chomp
	
	@acid_amount = 0 
	
		if drugs == "1" 
			@acid_amount += 1
		elsif drugs == "2"
			@acid_amount += 2
		else @acid_amount += 1
		puts "You can only start with 1 or 2 Hits man...Ill give you 1 hit for now. Don't Worry you will get more as time progresses  "
		end
		puts "You Started off with #{@acid_amount} hits of acid....Enjoy"
end


def get_high

	puts "How Many hits do you want man?" 
	
	@hits = $stdin.gets.chomp.to_i
		if @hits > 6
			puts "Man you are greedy Now all you are gonna get is 1 hit "
			@acid_amount += 1 
		else puts "Alright man here you go "
			@acid_amount += @hits
       	puts "You now have taken #{@acid_amount} hits."
		 @acid_amount
		end
	
		end
		
		
def lose_buzz
	
	puts "You buzz is gonna wear off by this amount"
	@loss = $stdin.gets.chomp.to_i
		puts "You buzz has wore off by  #{@loss} hits "
		
			@acid_amount -= @loss
		puts "This is how much your have left in your systme #{@acid_amount}"
		end

		
		
		
def add_to_stash
 @name = $stdin.gets.chomp
  @stash = [] unless @stash
  @stash << @name
  puts "You just added #{@name} to your stash"
  puts "You now have the following items in your stash #{@stash}" 
end


def del_stash
inven= $stdin.gets.chomp
@stash.delete(inven)
puts "You used #{inven} from your stash"
puts "You now have the following items left in your stash #{@stash}"
end

