class Pawn < GamePieces
	attr_reader :move_type, :icon, :color, :first_move

	def initialize(location, color)
		super
		@first_move = true
		set_move_type
		@icon = set_icon
	end

	def set_icon
		return @color == "black" ? "\u265F".encode('utf-8') : "\u2659".encode('utf-8')
	end

	def set_move_type
		if @first_move == true
			@color == "red" ? @move_type = [[2,0],[1,0]] : @move_type = [[-2,0],[-1,0]]
			@first_move = false
		else
			@color == "red" ? @move_type = [[1,0]] : @move_type = [[-1,0]]
		end
	end

	def move_to(destination)
		super
		set_move_type
	end

	def available_moves(destination, spot = @location, next_jumps = [], trail = {})
		super
	end 
end