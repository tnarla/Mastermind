require 'Mastermind2'
require 'stringio'

describe Mastermind2 do
	let (:game) { game = Mastermind2.new } 

	it "should have an answer of type array and have length of 4" do
		game.game_start
		game.answer.should be_an_instance_of Array
		game.answer.length.should == 4
	end

	it "should return true if the game is won" do
		game.user_input = ["1", "2", "3", "4"]
		game.answer = ["1", "2", "3", "4"]
		game.win?.should be_true
	end

	it "should return false if the game is not won" do
		game.user_input = ["1", "2", "3", "4"]
		game.answer = ["1", "3", "4", "4"]
		game.win?.should be_false
	end

	it "should return true if turns are greater than 10" do
		game.turns_taken = 12
		game.out_of_turns?.should be_true
	end

	it "should return true if turns are equal to 10" do
		game.turns_taken = 10
		game.out_of_turns?.should be_true
	end

	it "should return false if turns are less than 10" do
		game.turns_taken = 4
		game.out_of_turns?.should be_false
	end

	it "should return true if out of turns is true and win is false" do
		game.turns_taken = 10
		game.user_input = ["1", "2", "3", "4"]
		game.answer = ["1", "3", "4", "4"]
		game.game_over?.should be_true
	end

	it "should return true if out of turns is false and win is true" do
		game.turns_taken = 4
		game.user_input = ["1", "2", "3", "4"]
		game.answer = ["1", "2", "3", "4"]
		game.game_over?.should be_true
	end

	it "should return false if out of turns is false and win is false" do
		game.turns_taken = 4
		game.user_input = ["1", "2", "3", "4"]
		game.answer = ["1", "3", "4", "4"]
		game.game_over?.should be_false
	end

	it "should return true if out of turns is true and win is true" do
		game.turns_taken = 10
		game.user_input = ["1", "2", "3", "4"]
		game.answer = ["1", "2", "3", "4"]
		game.game_over?.should be_true
	end

	it "should print a win message when you win" do
		game.user_input = ["1", "2", "3", "4"]
		game.answer = ["1", "2", "3", "4"]
		output_stream = StringIO.new
		game.win_or_loss_message(output_stream)
	 	output_stream.rewind
		output_stream.gets.chomp.should == game.messages[:win_message]
	end

	it "should print a lose message when you lose" do
		game.user_input = ["1", "2", "3", "4"]
		game.answer = ["1", "5", "3", "4"]
		output_stream = StringIO.new
		game.win_or_loss_message(output_stream)
	 	output_stream.rewind
		output_stream.gets.chomp.should == game.messages[:lose_message]
		output_stream.gets.chomp.should == game.messages[:display_answer_message] 
	end

	it "should print the guesses left" do
		game.turns_taken = 8
		output_stream = StringIO.new
		game.guesses_left_prompt(output_stream)
	 	output_stream.rewind
		output_stream.gets.chomp.should == game.messages[:turns_left_message]
	end

	it "should print last guess" do
		game.turns_taken = 9
		output_stream = StringIO.new
		game.guesses_left_prompt(output_stream)
	 	output_stream.rewind
		output_stream.gets.chomp.should == game.messages[:last_guess_message]
	end

	it "should increment turns taken" do
		game.turns_taken = 9
		game.increment_turns_taken
		game.turns_taken.should == 10
	end

	it "should get user input when the input is valid" do
		input_stream = StringIO.new("herf\n1234\n")
		output_stream = StringIO.new
		game.get_valid_user_input(input_stream, output_stream)
		game.user_input.should == ["1", "2", "3", "4"]
		output_stream.gets.chomp.should == game.messages[:invalid_guess_message]
	end
end