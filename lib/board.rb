class Board
	attr_accessor :board, :pieces, :player_1, :player_2
	require './lib/game_pieces.rb'


	def initialize(player_1 = nil, player_2 = nil)
		@player_1 = player_1
		@player_2 = player_2
		@board = build_board
		set_board(@player_1)
		set_board(@player_2)
	end

	def build_board
		row = {}
		column = {}
		x = 0
		y = 0
		8.times do
			8.times do 
				row[[x,y]] = nil
				y+=1
			end
			y = 0
			column["Row #{x}"] = row
			row = {}
			x+=1
		end
		@board = column
	end

	def slider(cell)
		return @board["Row #{cell[0]}"][cell]
	end

	def delete(cell)
		return @board["Row #{cell[0]}"][cell] = nil
		# return @board["Row #{cell[0]}"][cell].nil? ? "" : @board["Row #{cell[0]}"][cell].location = nil
	end

	def check?
		false
	end

	def checkmate?
		false
	end

	def display
		puts "  _______________________________"
		8.times do |x|
			print " |   |   |   |   |   |   |   |   |\n"
			print "#{(x+65).chr}| #{@board["Row #{x}"][[x,0]] == nil ? " " : @board["Row #{x}"][[x,0]].icon} |"
			7.times { |y| print " #{@board["Row #{x}"][[x,y+1]] == nil ? " " : @board["Row #{x}"][[x,y+1]].icon} |" }
			print "\n |___|___|___|___|___|___|___|___|\n"
		end
		puts "   1   2   3   4   5   6   7   8  "
	end

	def set_board(player)
		player.pieces.each_piece.each do |piece|
			if !piece.nil?
				@board["Row #{piece.location[0]}"][piece.location] = piece
			end
		end
	end
end