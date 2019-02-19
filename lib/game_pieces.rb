class GamePieces
	attr_reader :location, :move_type, :next_available_move, :knight_1, :knight_2, :pawn_1, :pawn_2, :pawn_3, :pawn_4, :pawn_5, :pawn_6, :pawn_7, :pawn_8, :bishop_1, :bishop_2, :rook_1, :rook_2, :queen, :king

	require './lib/pieces/knight.rb'
	require './lib/pieces/pawn.rb'
	require './lib/pieces/bishop.rb'
	require './lib/pieces/rook.rb'
	require './lib/pieces/queen.rb'
	require './lib/pieces/king.rb'

	def initialize(location = nil)
		@location = location
		@move_type = move_type
	end

	def each_piece
		return [@knight_1, @knight_2, @pawn_1, @pawn_2, @pawn_3, @pawn_4, @pawn_5, @pawn_6, @pawn_7, @pawn_8, @bishop_1, @bishop_2, @rook_1, @rook_2, @queen, @king]
	end

	def display_path(path)
		path.reverse.each_with_index do |jump, index|
			if index == 0
				puts "YOU JUMPED FROM #{jump} "
			elsif index == path.size-1
				# @location = jump
				puts "TO #{jump}."
			else
				puts "TO #{jump} "
			end
		end
	end

	def set_path(destination, ary = [])
		@next_available_move.each do |key, value| 
			value.each do |x|
				if ary[-1].eql?(@location)
					return ary
				elsif x.eql?(destination)
					ary.push(x)
					set_path(key, ary)
				end
			end
		end
		return ary
	end

	def available_moves(destination, spot = @location, next_jumps = [], trail = {})
		return spot if spot[0] == destination[0] && spot[1] == destination[1]

		move_type.each do |jump|
			temp_spot = []

			temp_spot[0] = jump[0] + spot[0]
			temp_spot[1] = jump[1] + spot[1]

			on_board?(temp_spot) ? next_jumps.push(temp_spot) : ""

			if on_board?(temp_spot)
				trail[spot].nil? ? trail[spot] = temp_spot : trail[spot]+=temp_spot
			end
	
			if temp_spot[0] == destination[0] && temp_spot[1] == destination[1]
				# @next_available_move = trail
				set_moves
				path = set_path(destination)
				display_path(path)
				@location = destination
				return @next_available_move
			end
		end
		@next_available_move = trail
		available_moves(destination, next_jumps.shift, next_jumps, trail)
	end

	def on_board?(jump)
		if jump[0] >= 0 && jump[0] <= 7 && jump[1] >= 0 && jump[1] <= 7
			return true
		end
		false
	end

	def set_moves
		# puts "NEXT AVAILABLE MOVES:#{@next_available_move}"
		@next_available_move.each do |key, value|
			tmp = value
			@next_available_move[key] = []
			loop do
				break if tmp == []
				@next_available_move[key]<<tmp.slice!(0,2)
			end
		end
	end

	def place_pieces
		@pawn_1 = Pawn.new([1,0])
		@pawn_2 = Pawn.new([1,1])
		@pawn_3 = Pawn.new([1,2])
		@pawn_4 = Pawn.new([1,3])
		@pawn_5 = Pawn.new([1,4])
		@pawn_6 = Pawn.new([1,5])
		@pawn_7 = Pawn.new([1,6])
		@pawn_8 = Pawn.new([1,7])
		@knight_1 = Knight.new([0,1])
		@knight_2 = Knight.new([0,6])
		@bishop_1 = Bishop.new([0,2])
		@bishop_2 = Bishop.new([0,5])
		@rook_1 = Rook.new([0,0])
		@rook_2 = Rook.new([0,7])
		@queen = Queen.new([0,3])
		@king = King.new([0,4])
	end

end