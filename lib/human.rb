class Human
	attr_accessor :name, :side_color

	def initialize(name, side_color)
		@name = name
		# game_piece.nil? ? @game_piece = get_game_piece : @game_piece = game_piece
		@side_color = side_color
	end

	def guess
		puts "#{name.capitalize}, where do you want to drop you piece?"
		num = gets.chomp.to_i
		if num > 0 && num < 8
			return num
		else
			puts "It has to be between 1 and 7."
			guess
		end
	end

	# def get_game_piece
	# 	@game_piece = @name[0].upcase
	# end

end