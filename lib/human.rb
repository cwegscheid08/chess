class Human
	attr_accessor :name, :side_color, :pieces
	require './lib/game_pieces.rb'

	def initialize(name, side_color)
		@name = name
		@side_color = side_color
		set_game_pieces
	end

	def move(piece = nil, cell = nil)
		@pieces.each_piece.each { |x| print "#{x.icon} "}
		puts
		piece = gets.downcase.chomp
		puts "To where?"
		cell = gets.chomp
		@pieces.piece.move_to(cell)
	end

	def set_game_pieces
		@pieces = GamePieces.new()
		@pieces.place_pieces(@side_color)
	end
end