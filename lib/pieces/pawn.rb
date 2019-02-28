class Pawn < GamePieces
	attr_reader :move_type, :icon, :color

	def initialize(location, color)
		super
		@move_type = set_move_type
		@icon = set_icon
	end

	def set_icon
		return @color == "black" ? "\u265F".encode('utf-8') : "\u2659".encode('utf-8')
	end

	def set_move_type
		@color == "red" ? @move_type = [[1,0]] : @move_type = [[-1,0]]
	end

	def move_to(destination)
		super
	end


	def available_moves(destination, spot = @location, next_jumps = [], trail = {})
		super
	end 
end