def start_with_amount
	puts "You wanna start with 1 or 2 hits?" 
drugs = $stdin.gets.chomp
	
	@start_amount = 0 
	
		if drugs == "1" 
			@start_amount += 1
		elsif drugs == "2"
			@start_amount += 2
		else puts "You can only start with 1 or 2 Hits man... Don't Worry you will get more as time progresses  "
		end
		puts "You Started off with #{@start_amount} hits of acid....Enjoy"
end


def get_high(hits)
 acid_amount = @start_amount
			puts "How Many hits do you want man?" 
	
	@hits = $stdin.gets.chomp.to_i
		if @hits > 6
			puts "Man you are greedy Now all you get is 1 hit "
			acid_amount += 1 
		else puts "Alright man here you go "
			acid_amount += @hits
       	puts "You now have taken #{acid_amount} hits."
		 acid_amount
		end
		end
		
		# if session[:acid]== ""
			# @start_amount = 0
				# if session[:acid] == "1"
					# @start_amount += 1
				# elsif session[:acid] == "2"
					# @start_amount += 2
				# else @start_amount += 1
				# end
			# end
			
			# session[:acid] = params[:acid]