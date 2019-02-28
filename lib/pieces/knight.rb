class Knight < GamePieces
	attr_reader :move_type, :icon

	def initialize(location, color)
		super
		@move_type = [[2,1],[2,-1],[-2,1],[-2,-1],[1,2],[-1,2],[1,-2],[-1,-2]]
		@icon = set_icon
	end

	def set_icon
		return @color == "black" ? "\u265E".encode('utf-8') : "\u2658".encode('utf-8')
	end

	def move_to(destination)
		super
	end


	def available_moves(destination, spot = @location, next_jumps = [], trail = {})
		super
	end 
end