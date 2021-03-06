class GamePieces
	attr_reader :each_piece, :location, :color, :move_type, :next_available_move, :knight_1, :knight_2, :pawn_1, :pawn_2, :pawn_3, :pawn_4, :pawn_5, :pawn_6, :pawn_7, :pawn_8, :bishop_1, :bishop_2, :rook_1, :rook_2, :queen, :king

	require './lib/pieces/knight.rb'
	require './lib/pieces/pawn.rb'
	require './lib/pieces/bishop.rb'
	require './lib/pieces/rook.rb'
	require './lib/pieces/queen.rb'
	require './lib/pieces/king.rb'

	def initialize(location = nil, color = nil)
		@color = color
		@location = location
		@move_type = move_type
		# available_moves
	end


	# def set_each_piece
	# # def each_piece
	# 	@each_piece = []
	# 	@each_piece.push([@pawn_1, @pawn_2, @pawn_3, @pawn_4, @pawn_5, @pawn_6, @pawn_7, @pawn_8, @knight_1, @knight_2, @bishop_1, @bishop_2, @rook_1, @rook_2, @queen, @king])
	# 	return @each_piece
	# 	# return [@pawn_1, @pawn_2, @pawn_3, @pawn_4, @pawn_5, @pawn_6, @pawn_7, @pawn_8, @knight_1, @knight_2, @bishop_1, @bishop_2, @rook_1, @rook_2, @queen, @king]
	# end

	def move_to(destination)
		moves = available_moves(destination)
		# puts "MOVES:#{moves}"	
		# puts "MOVE_NIL#{moves.nil?}"
		# puts "NEXT_AVAILABLE_MOVE:#{self.next_available_move}"
		puts "JUMPED FROM #{self.location}"
		# self.location = moves
		# !moves.nil? ? @location = moves : ""
		@location = moves
		puts "YOU'RE AT #{self.location}"
		return moves
	end

	# def display_path(path)
	# 	path.reverse.each_with_index do |jump, index|
	# 		if index == 0
	# 			# puts "YOU JUMPED FROM #{jump} "
	# 		elsif index == path.size-1
	# 			@location = jump
	# 			# puts "TO #{jump}."
	# 			return jump
	# 		else
	# 			# puts "TO #{jump} "
	# 		end
	# 	end
	# end

	# def set_path(destination, ary = [])
	# 	@next_available_move.each do |key, value| 
	# 		value.each do |x|
	# 			if ary[-1].eql?(@location)
	# 				return ary
	# 			elsif x.eql?(destination)
	# 				ary.push(x)
	# 				set_path(key, ary)
	# 			end
	# 		end
	# 	end
	# 	return ary
	# end

	def available_moves(destination, spot = @location, next_jumps = [], trail = {})
		# puts "SPOT:#{spot} DESTINATION:#{destination}"
		return spot if spot[0] == destination[0] && spot[1] == destination[1]

		# puts "MOVE TYPE:#{move_type}"

		move_type.each do |jump|
			temp_spot = []

			temp_spot[0] = jump[0] + spot[0]
			temp_spot[1] = jump[1] + spot[1]

			on_board?(temp_spot) ? next_jumps.push(temp_spot) : ""

			if on_board?(temp_spot)
				trail[spot].nil? ? trail[spot] = temp_spot : trail[spot]+=temp_spot
			end
	
			if temp_spot[0] == destination[0] && temp_spot[1] == destination[1]
				@next_available_move = trail
				# set_moves
				# path = set_path(destination)
				# display_path(path)
				# puts "TRAIL:#{trail}"
				# puts "NEXT_AVAILABLE_MOVE:#{@next_available_move}"
				# @location = destination
				# return @next_available_move
				return destination
			end
		end

		return @location

		# if !@next_available_move.has_value?(destination)
		# 	return nil
		# end



		# if trail.has_value?(destination)
		# 	@next_available_move = trail
			# puts "TRAIL:#{trail}"
			# puts "NEXT_AVAILABLE_MOVE:#{@next_available_move}"
		# 	# set_moves
		# 	@location = destination
		# end

		# @next_available_move = trail

		# return nil

		# return @next_available_move

		# ENGAGE TO MOVE TO ANY AVAILABLE MOVE
		# available_moves(destination, next_jumps.shift, next_jumps, trail)
	end

	def on_board?(jump)
		if jump[0] >= 0 && jump[0] <= 7 && jump[1] >= 0 && jump[1] <= 7
			return true
		end
		false
	end

	def set_moves
		@next_available_move.each do |key, value|
			tmp = value
			@next_available_move[key] = []
			loop do
				break if tmp == []
				@next_available_move[key]<<tmp.slice!(0,2)
			end
		end
	end

	def place_pieces(color)
		if color == "red"
			# puts "RED\n\n\n"
			@each_piece = Array.new
			@each_piece.push(@pawn_1 = Pawn.new([1,0], color))
			@each_piece.push(@pawn_2 = Pawn.new([1,1], color))
			@each_piece.push(@pawn_3 = Pawn.new([1,2], color))
			@each_piece.push(@pawn_4 = Pawn.new([1,3], color))
			@each_piece.push(@pawn_5 = Pawn.new([1,4], color))
			@each_piece.push(@pawn_6 = Pawn.new([1,5], color))
			@each_piece.push(@pawn_7 = Pawn.new([1,6], color))
			@each_piece.push(@pawn_8 = Pawn.new([1,7], color))
			@each_piece.push(@knight_1 = Knight.new([0,1], color))
			@each_piece.push(@knight_2 = Knight.new([0,6], color))
			@each_piece.push(@bishop_1 = Bishop.new([0,2], color))
			@each_piece.push(@bishop_2 = Bishop.new([0,5], color))
			@each_piece.push(@rook_1 = Rook.new([0,0], color))
			@each_piece.push(@rook_2 = Rook.new([0,7], color))
			@each_piece.push(@queen = Queen.new([0,3], color))
			@each_piece.push(@king = King.new([0,4], color))
		else
			# puts "BLACK\n\n\n"
			@each_piece = Array.new
			@each_piece.push(@pawn_1 = Pawn.new([6,0], color))
			@each_piece.push(@pawn_2 = Pawn.new([6,1], color))
			@each_piece.push(@pawn_3 = Pawn.new([6,2], color))
			@each_piece.push(@pawn_4 = Pawn.new([6,3], color))
			@each_piece.push(@pawn_5 = Pawn.new([6,4], color))
			@each_piece.push(@pawn_6 = Pawn.new([6,5], color))
			@each_piece.push(@pawn_7 = Pawn.new([6,6], color))
			@each_piece.push(@pawn_8 = Pawn.new([6,7], color))
			@each_piece.push(@knight_1 = Knight.new([7,1], color))
			@each_piece.push(@knight_2 = Knight.new([7,6], color))
			@each_piece.push(@bishop_1 = Bishop.new([7,2], color))
			@each_piece.push(@bishop_2 = Bishop.new([7,5], color))
			@each_piece.push(@rook_1 = Rook.new([7,0], color))
			@each_piece.push(@rook_2 = Rook.new([7,7], color))
			@each_piece.push(@queen = Queen.new([7,3], color))
			@each_piece.push(@king = King.new([7,4], color))
		end
	end
end