class Answer
	def make
		numbers = ('0'..'9').to_a
		@answer = []
		r= Random.new

		4.times do 
			@answer << numbers[r.rand(10)]
		end
		@answer
	end
end