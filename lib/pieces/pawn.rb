class Pawn < GamePieces
	attr_reader :move_type, :icon

	def initialize(location)
		super
		@move_type = [[1,0]]
		@icon = set_icon
	end

	def set_icon
		return "P"
	end

	def move_to(destination)
		moves = available_moves(destination)
		puts "YOU'RE AT #{self.location}"
	end


	def available_moves(destination, spot = @location, next_jumps = [], trail = {})
		super
	end 
end