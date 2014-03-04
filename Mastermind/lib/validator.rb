class Validator
	def correct_size?(array)
		array.count == 4
	end

	def digit?(character)
		digits = ("0".."9").to_a
		digits.include? character
	end


	def all_numbers?(array)
		array.each do |character|
			if !digit?(character)
				return false
			end
		end
		true
	end
	
	def valid_input?(user_input)
		all_numbers?(user_input) && correct_size?(user_input)
	end
end