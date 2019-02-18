class Computer
	attr_accessor :name, :side_color

	def initialize(name = "computer", side_color)
		@name = name
		# @game_piece = game_piece
		@side_color = side_color
	end

	def guess
		puts "\n\nI'M THINKING...\n"
		sleep(1)
		return rand(1..7)
	end

	def randomizer

	end
end