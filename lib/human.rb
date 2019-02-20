class Human
	attr_accessor :name, :side_color, :pieces
	require './lib/game_pieces.rb'

	def initialize(name, side_color)
		@name = name
		@side_color = side_color
		set_game_pieces
	end

	def move
		puts "#{@name.capitalize}, jump from which cell??"
		from = gets.chomp.split(" ")
		puts "to which cell??"
		to = gets.chomp.split(" ")
		from = [from, to]
		# puts "FROM:#{from} TO:#{to}"
		from.each { |x| x.map! { |y| y.to_i }}
		# puts "FROM:#{from}"
		return from
	end

	def set_game_pieces
		@pieces = GamePieces.new()
		@pieces.place_pieces(@side_color)
	end
end