class Board
	attr_accessor :board, :pieces
	require './lib/game_pieces.rb'


	def initialize
		@board = build_board
		set_game_pieces
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



	def display
		puts " _______________________________"
		8.times do |x|
			y = 0
			


			print "|   |   |   |   |   |   |   |   |\n"
			# print "|   |   |   |   |   |   |   |   |\n"
			print "| #{@board["Row #{x}"][[x,y]] == nil ? " " : @board["Row #{x}"][[x,y]]} |"
			print " #{@board["Row #{x}"][[x,y+1]] == nil ? " " : @board["Row #{x}"][[x,y+1]]} |"
			print " #{@board["Row #{x}"][[x,y+2]] == nil ? " " : @board["Row #{x}"][[x,y+2]]} |"
			print " #{@board["Row #{x}"][[x,y+3]] == nil ? " " : @board["Row #{x}"][[x,y+3]].icon} |"
			print " #{@board["Row #{x}"][[x,y+4]] == nil ? " " : @board["Row #{x}"][[x,y+4]]} |"
			print " #{@board["Row #{x}"][[x,y+5]] == nil ? " " : @board["Row #{x}"][[x,y+5]]} |"
			print " #{@board["Row #{x}"][[x,y+6]] == nil ? " " : @board["Row #{x}"][[x,y+6]]} |"
			print " #{@board["Row #{x}"][[x,y+7]] == nil ? " " : @board["Row #{x}"][[x,y+7]]} |\n"
			print "|___|___|___|___|___|___|___|___|\n"
			
		end
		# print "X:#{x} Y:#{y}\n"
	end

	def set_game_pieces
		@pieces = GamePieces.new()
		@pieces.place_pieces
		set_board
	end

	def set_board
		@board["Row #{@pieces.knight.location[0]}"][@pieces.knight.location] = @pieces.knight
	end
end