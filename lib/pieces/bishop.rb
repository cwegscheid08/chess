class Bishop < GamePieces
	attr_reader :move_type, :icon

	def initialize(location, color)
		super
		@move_type = set_move_type
		@icon = set_icon
	end

	def set_icon
		return @color == "black" ? "\u265D".encode('utf-8') : "\u2657".encode('utf-8')
	end

	def move_to(destination)
		moves = available_moves(destination)
		puts "YOU'RE AT #{self.location}"
	end

	def set_move_type
		@move_type = [[-1,1],[1,1],[1,-1],[-1,-1]]
		tmp = []
		tmp.push(@move_type)
		8.times do |x|
			
			4.times do |y|
				@move_type[y][0] + tmp[y][0] 
			end
		end

		return @move_type = tmp
	end


	def available_moves(destination, spot = @location, next_jumps = [], trail = {})
		super
	end 
end