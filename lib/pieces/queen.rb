class Queen < GamePieces
	attr_reader :move_type, :icon

	def initialize(location, color)
		super
		@move_type = set_move_type
		@icon = set_icon
	end

	def set_icon
		return @color == "black" ? "\u265B".encode('utf-8') : "\u2655".encode('utf-8')
	end

	def move_to(destination)
		moves = available_moves(destination)
		puts "YOU'RE AT #{self.location}"
	end

	def set_move_type
		moves = [[-1,1],[0,1],[1,1],[1,0],[0,-1],[-1,-1]]
		8.times do |x|
			tmp = moves
			tmp[0].each { |y| y+=x+1 }
			puts "TMP:#{tmp}"
			moves << tmp
			return moves
		end
	end


	def available_moves(destination, spot = @location, next_jumps = [], trail = {})
		super
	end 
end