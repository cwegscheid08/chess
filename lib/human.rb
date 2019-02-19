class Human
	attr_accessor :name, :side_color, :pieces
	require './lib/game_pieces.rb'

	def initialize(name, side_color)
		@name = name
		# game_piece.nil? ? @game_piece = get_game_piece : @game_piece = game_piece
		@side_color = side_color
		set_game_pieces
	end

	def move
		puts "#{name.capitalize}, where do you want to drop you piece?"
		puts "#{name.capitalize}, "
		num = gets.chomp.to_i
		if num > 0 && num < 8
			return num
		else
			puts "It has to be between 1 and 7."
			guess
		end
	end

	def set_game_pieces
		@pieces = GamePieces.new()
		@pieces.place_pieces(@side_color)
		# set_board(@pieces.each_piece)
	end

end