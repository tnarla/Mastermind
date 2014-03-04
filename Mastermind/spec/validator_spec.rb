require "validator"

describe Validator do
	let (:validator) {validator = Validator.new}
	it "should return true if the user input is 4" do
		test_array = ["1", "2", "3", "4"]
		validator.correct_size?(test_array).should == true
	end

	it "should return false if the user input is not 4" do
		test_array = ["1", "2", "3", "4", "5"]
		validator.correct_size?(test_array).should == false
	end

	it "should return false if there is something that's not a number" do
		test_array = "+"
		validator.digit?(test_array).should == false
	end

	it "should return true if a string is a number" do
		test_array = "1"
		validator.digit?(test_array).should == true
	end

	it "should return false if there is a character anywhere in the array" do
		test_array = ["1", "b", "3", "+"]
		validator.all_numbers?(test_array).should == false
	end

	it "should return true if there isn't a character in the array" do
		test_array = ["1", "2", "3", "4"]
		validator.all_numbers?(test_array).should == true
	end

	it "should return true when the input is all numbers and right size" do
		test_array = ["1", "2", "3", "4"]
		validator.valid_input?(test_array).should == true
	end

	it "should return false when the input is not all numbers but right size" do
		test_array = ["1", "2", "f", "4"]
		validator.valid_input?(test_array).should == false
	end

	it "should return false when the input is all numbers but not right size" do
		test_array = ["1", "2", "3", "4", "5"]
		validator.valid_input?(test_array).should == false
	end

	it "should return false when the input is not all numbers and not right size" do
		test_array = ["1", "2", "3", "4", "g"]
		validator.valid_input?(test_array).should == false
	end

end