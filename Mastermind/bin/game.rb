$LOAD_PATH.unshift File.expand_path(File.join(File.dirname(__FILE__), "/../lib" ))
require 'Mastermind2'
	play = Mastermind2.new
	play.game_start
	play.game_loop($stdin, $stdout)
