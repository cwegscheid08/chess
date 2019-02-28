class King < GamePieces
	attr_reader :move_type, :icon

	def initialize(location, color)
		super
		@move_type = [[-1,1],[0,1],[1,1],[1,0],[1,-1],[0,-1],[-1,-1],[-1,0]]
		@icon = set_icon
	end

	def set_icon
		return @color == "black" ? "\u265A".encode('utf-8') : "\u2654".encode('utf-8')
	end

	def move_to(destination)
		super
	end


	def available_moves(destination, spot = @location, next_jumps = [], trail = {})
		super
	end 
end