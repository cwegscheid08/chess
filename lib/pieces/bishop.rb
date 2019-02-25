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
		super
		# moves = available_moves(destination)
		# puts "YOU'RE AT #{self.location}"
	end

	def set_move_type
		@move_type = [[-1,1],[1,1],[1,-1],[-1,-1]]
		tmp = [[-1,1],[1,1],[1,-1],[-1,-1]]
		i = 0
		6.times do |x|
			tmp.each do |jump|
				# puts "TMP:#{tmp[x][1]} X:#{x} JUMP:#{jump[0]}"
				# print "TMP:#{tmp}\n"
				# print "X:#{x}\n"
				# print "I:#{i}\n"
				# print "JUMP:#{jump}\n"
				# print "JUMP[0]:#{jump[0]}\n"
				# puts "MOVE:#{([jump[0] + tmp[i][0], jump[1] + tmp[i][1]])}"
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