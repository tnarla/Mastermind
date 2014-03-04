require 'pry'
require 'guess_checker'
require 'validator'
require 'answer'

class Mastermind2
	attr_accessor :user_input, :turns_taken, :answer
	

	def initialize
		@guess_checker = GuessChecker.new
		@validator = Validator.new
		@turns_taken = 0
		@answer_class = Answer.new
	end

	def messages
		{
			win_message: 			 "You Win! ;D",
			lose_message:            "Game Over :(",
			display_answer_message:  "The answer was #{@answer}",
			turns_left_message: 	 "You have #{10 - @turns_taken} guesses! Good luck!",
			last_guess_message: 	 "Last guess!",
			invalid_guess_message:   "Please enter a FOUR digit NUMBER"
		}
	end

	def game_start
		@answer = @answer_class.make
		# p @answer
	end

	def game_loop(input_stream, output_stream)
		while !game_over?
			guesses_left_prompt(output_stream)
			get_valid_user_input(input_stream, output_stream)
			evaluate_guess
			increment_turns_taken
			break if win?
		end
	win_or_loss_message(output_stream)
	end

	def win_or_loss_message(output_stream)
		if win? 
			output_stream.puts messages[:win_message]
		else
			output_stream.puts messages[:lose_message]
			output_stream.puts messages[:display_answer_message]
		end
	end

	def game_over?
		out_of_turns? or win?
	end

	def win?
		@user_input == @answer
	end

	def out_of_turns?
		@turns_taken >= 10
	end

	def get_valid_user_input(input_stream, output_stream)
		@user_input = input_stream.gets.chomp.split("")
		if !valid_input?
			output_stream.puts messages[:invalid_guess_message]
			get_valid_user_input(input_stream, output_stream)
		end
	end

	def valid_input?
		@validator.valid_input?(@user_input)
	end

	def increment_turns_taken
		@turns_taken += 1
	end

	def evaluate_guess
		p @guess_checker.evaluate(@user_input.dup, @answer.dup)
	end

	def guesses_left_prompt(output_stream)
		# binding.pry
		if @turns_taken <= 8
			output_stream.puts messages[:turns_left_message]
		elsif @turns_taken == 9
			output_stream.puts messages[:last_guess_message]
		end

	end
end

	
