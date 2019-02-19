class Computer
	attr_accessor :name, :side_color, :pieces
	require './lib/game_pieces.rb'

	def initialize(name = "computer", side_color)
		@name = name
		# @game_piece = game_piece
		@side_color = side_color
		set_game_pieces
	end

	def move
		puts "\n\nI'M THINKING...\n"
		sleep(1)
		return rand(1..7)
	end

	def randomizer

	end

	def set_game_pieces
		@pieces = GamePieces.new()
		@pieces.place_pieces(@side_color)
		# set_board(@pieces.each_piece)
	end
end