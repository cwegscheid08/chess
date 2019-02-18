class Board
	attr_accessor :board	


	def initialize
		@board = build_board
		puts "BOARD:#{@board.to_s}"
	end

	def place_piece(player, player_guess, x = 0)
		if @board["column_#{player_guess}"][[player_guess-1,x]].nil?
			@board["column_#{player_guess}"][[player_guess-1,x]] = player.game_piece
			return [player_guess-1,x]
		else
			place_piece(player, player_guess, x+=1)
		end
	end


	def four_in_a_row?
		moves = [[-1,0],[1,0],[0,1],[0,-1],[-1,1],[1,1],[-1,-1],[1,-1]]

		@board.each do |key, value|
			value.each do |x, y|
				if !y.nil?
					moves.each do |move|
						if adjacent_cell_search(x, y, move) 
							return true
						end
					end
				end
			end
		end
		false
	end

	def adjacent_cell_search(cell, value, move, bank = [])
		tmp = []
		bank.push(value)
		3.times do |x|
			if tmp[0].nil?
				array = []
				array.push(cell[0] + move[0])
				array.push(cell[1] + move[1])
				tmp.push(array)
			else
				array = []
				array.push(tmp[-1][0] + move[0])
				array.push(tmp[-1][1] + move[1])
				tmp.push(array)
			end
			on_board?(tmp[-1]) ? bank.push(@board["column_#{tmp[-1][0]+1}"][tmp[-1]]) : ""
		end
		if !bank[0].nil? && bank.size == 4 && bank.each { |x| x == value ? true : (return false) }
			return true
		end
		return false
	end

	def on_board?(cell)
		(cell[0] < 7 && cell[1] < 6 && cell[0] >= 0 && cell[1] >= 0) ? true : false
	end

	def full?
		@board.each_key do |key|
			if @board[key].value?(nil)
				return false
			end
		end
		return true
	end

	def column_full?(column)
		@board[column].value?(nil) ? false : true
	end

	def display
		@board.each_key { |key| print "#{key.upcase}   "}
		puts
		6.times do |x|
			@board.each_value do |value|
				print "[   #{value.values[5-x].nil? ? " " : value.values[5-x]}  ]   "
			end
			puts
		end
	end

	def fill
		@board.each_key do |key|
			@board[key].each_key do |cell|
				@board[key][cell] = "C"
			end
		end
	end


	private

	def build_board
		cell = {}
		column = {}
		x = 0
		y = 0
		7.times do
			6.times do
				cell[[x,y]] = nil
				y+=1
			end
			y = 0
			column["column_#{x+1}"] = cell
			cell = {}
			x += 1
		end
		@board = column
		
	end
end
