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
		piece = @pieces.each_piece[rand(@pieces.each_piece.size)]
		destination = [rand(7), rand(7)]
		return [@pieces.each_piece[rand(@pieces.each_piece.size)].location, destination]
	end

	def set_game_pieces
		@pieces = GamePieces.new()
		@pieces.place_pieces(@side_color)
	end
end