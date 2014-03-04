class GuessChecker
	def evaluate(user_input, answer)
			@feedback = []
			@user_input = user_input
			@answer = answer

			check_for_exact_matches
			check_for_near_matches
			check_for_no_matches

			@feedback.sort
	end 

	def check_for_exact_matches
		@user_input.each_with_index do |guess_character, index| 
			if @user_input[index] == @answer[index]
				@feedback << "+"  
				@user_input[index] = "a"
				@answer[index] = "a"
			end
		end
	end

	def check_for_near_matches
		@user_input.each_with_index do |guess_character, index|
			if @answer.include?(@user_input[index]) && @user_input[index] != "a"
				position_of_near_match = @answer.index(@user_input[index])
				@feedback << "-"  
				@user_input[index] = "a"
				@answer[position_of_near_match] = "a"
			end
		end
	end

	def check_for_no_matches
		@user_input.each_with_index do |guess_character, index| 
			if @user_input[index] != "a"
				@feedback << "x"
			end
		end
	end

end


