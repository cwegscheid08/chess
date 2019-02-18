class Computer
	attr_accessor :name, :game_piece

	def initialize(name, game_piece = "X")
		@name = name
		@game_piece = game_piece
	end

	def guess
		puts "\n\nI'M THINKING...\n"
		sleep(1)
		return rand(1..7)
	end
end