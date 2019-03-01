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
		super
	end

	def set_move_type
		@move_type = [[-1,1],[0,1],[1,1],[1,0],[1,-1],[0,-1],[-1,-1],[-1,0]]
		tmp = [[-1,1],[0,1],[1,1],[1,0],[1,-1],[0,-1],[-1,-1],[-1,0]]
		i = 0
		6.times do |x|
			tmp.each do |jump|
				@move_type.push([jump[0] + @move_type[i][0], jump[1] + @move_type[i][1]])
				i+=1
			end
		end
		return @move_type
	end


	def available_moves(destination, spot = @location, next_jumps = [], trail = {})
		super
	end 
end