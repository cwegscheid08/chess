class Knight < GamePieces
	attr_reader :move_type

	def initialize(location)
		super
		@move_type = [[2,1],[2,-1],[-2,1],[-2,-1],[1,2],[-1,2],[1,-2],[-1,-2]]
	end

	def knight_moves(destination)
		moves = available_moves(destination)

		puts "YOU'RE AT #{self.location}"

	end

	def set_path(destination, ary = [])
		super
	end

	def available_moves(destination, spot = @location, next_jumps = [], trail = {})
		super
	end 

end