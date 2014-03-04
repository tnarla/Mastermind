require "guess_checker"

describe GuessChecker do
	let (:guess_checker) {guess_checker = GuessChecker.new}

## NO MATCHES ##
	it "should return no matches" do
			answer = ["1", "2", "3", "4"]
			user_input = ["5", "5", "5", "5"]
			guess_checker.evaluate(user_input, answer).should == ["x", "x", "x", "x"]
	end

### EXACT MATCHES ONLY ###
	it "should return 1 exact match" do
			answer = ["1", "2", "3", "4"]
			user_input = ["1", "5", "5", "5"]
			guess_checker.evaluate(user_input, answer).should == ["+", "x", "x", "x"]
	end

	it "should return 2 exact matches" do
			answer = ["1", "2", "3", "4"]
			user_input = ["1", "2", "5", "5"]
			guess_checker.evaluate(user_input, answer).should == ["+", "+", "x", "x"]
	end

	it "should return 3 exact matches" do
			answer = ["1", "2", "3", "4"]
			user_input = ["1", "2", "3", "5"]
			guess_checker.evaluate(user_input, answer).should == ["+", "+", "+", "x"]
	end

	it "should return 4 exact matches" do
			answer = ["1", "2", "3", "4"]
			user_input = ["1", "2", "3", "4"]
			guess_checker.evaluate(user_input, answer).should == ["+", "+", "+", "+"]
	end

### NEAR MATCHES ONLY ###
	it "should return 1 near match" do
			answer = ["1", "2", "3", "4"]
			user_input = ["5", "1", "5", "5"]
			guess_checker.evaluate(user_input, answer).should == ["-", "x", "x", "x"]
	end

	it "should return 2 near matches" do
			answer = ["1", "2", "3", "4"]
			user_input = ["5", "1", "2", "5"]
			guess_checker.evaluate(user_input, answer).should == ["-", "-", "x", "x"]
	end

	it "should return 3 near matches" do
			answer = ["1", "2", "3", "4"]
			user_input = ["5", "1", "2", "3"]
			guess_checker.evaluate(user_input, answer).should == ["-", "-", "-", "x"]
	end

	it "should return 4 near matches" do
			answer = ["1", "2", "3", "4"]
			user_input = ["4", "1", "2", "3"]
			guess_checker.evaluate(user_input, answer).should == ["-", "-", "-", "-"]
	end

### EXACT MATCHES AND NEAR MATCHES ###
	it "should return 1 exact match and 1 near match" do
			answer = ["1", "2", "3", "4"]
			user_input = ["5", "2", "5", "3"]
			guess_checker.evaluate(user_input, answer).should == ["+", "-", "x", "x"]
	end

	it "should return 1 exact match and 2 near matches" do
			answer = ["1", "2", "3", "4"]
			user_input = ["5", "2", "4", "3"]
			guess_checker.evaluate(user_input, answer).should == ["+", "-", "-", "x"]
	end

	it "should return 1 exact match and 3 near matches" do
			answer = ["1", "2", "3", "4"]
			user_input = ["4", "2", "1", "3"]
			guess_checker.evaluate(user_input, answer).should == ["+", "-", "-", "-"]
	end

	it "should return 2 exact matches and 1 near match" do
			answer = ["1", "2", "3", "4"]
			user_input = ["1", "2", "5", "3"]
			guess_checker.evaluate(user_input, answer).should == ["+", "+", "-", "x"]
	end

	it "should return 2 exact matches and 2 near matches" do
			answer = ["1", "2", "3", "4"]
			user_input = ["1", "2", "4", "3"]
			guess_checker.evaluate(user_input, answer).should == ["+", "+", "-", "-"]
	end

### TESTING FOR DUPLICATES ###

	it "should only return one plus with one exact match" do
		answer = ["1", "2", "3", "4"]
		user_input = ["5", "2", "5", "2"]
		guess_checker.evaluate(user_input, answer).should == ["+", "x", "x", "x"]
	end

	it "should only return one plus with four duplicate numbers" do
		answer = ["1", "2", "3", "4"]
		user_input = ["2", "2", "2", "2"]
		guess_checker.evaluate(user_input, answer).should == ["+", "x", "x", "x"]
	end	

	it "should only return one minus with duplicates" do
		answer = ["1", "2", "3", "4"]
		user_input = ["5", "1", "1", "1"]
		guess_checker.evaluate(user_input, answer).should == ["-", "x", "x", "x"]
	end	


end