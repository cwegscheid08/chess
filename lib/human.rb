class Human
	attr_accessor :name, :side_color, :pieces
	require './lib/game_pieces.rb'

	def initialize(name, side_color)
		@name = name
		@side_color = side_color
		set_game_pieces
	end

	def move
		puts "#{@name.capitalize}, you have the #{side_color} pieces.\nJump from which cell??"
		from = gets.chomp.split(//)
		from.delete(" ")
		from[0] = from[0].upcase.ord-65
		from[1] = from[1].to_i-1
		puts "to which cell??"
		to = gets.chomp.split(//)
		to.delete(" ")
		to[0] = to[0].upcase.ord-65
		to[1] = to[1].to_i-1
		from = [from, to]
		return from
	end

	def set_game_pieces
		@pieces = GamePieces.new()
		@pieces.place_pieces(@side_color)
	end
end