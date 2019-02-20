class Board
	attr_accessor :board, :pieces, :player_1, :player_2
	require './lib/game_pieces.rb'


	def initialize(player_1 = nil, player_2 = nil)
		@player_1 = player_1
		@player_2 = player_2
		@board = build_board
		set_board
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
	end

	def check?
		false
	end

	def checkmate?
		false
	end



	def display
		puts " _______________________________"
		8.times do |x|
			y = 0
			


			print "|   |   |   |   |   |   |   |   |\n"
			# print "|   |   |   |   |   |   |   |   |\n"
			print "| #{@board["Row #{x}"][[x,y]] == nil ? " " : @board["Row #{x}"][[x,y]].icon} |"
			print " #{@board["Row #{x}"][[x,y+1]] == nil ? " " : @board["Row #{x}"][[x,y+1]].icon} |"
			print " #{@board["Row #{x}"][[x,y+2]] == nil ? " " : @board["Row #{x}"][[x,y+2]].icon} |"
			print " #{@board["Row #{x}"][[x,y+3]] == nil ? " " : @board["Row #{x}"][[x,y+3]].icon} |"
			print " #{@board["Row #{x}"][[x,y+4]] == nil ? " " : @board["Row #{x}"][[x,y+4]].icon} |"
			print " #{@board["Row #{x}"][[x,y+5]] == nil ? " " : @board["Row #{x}"][[x,y+5]].icon} |"
			print " #{@board["Row #{x}"][[x,y+6]] == nil ? " " : @board["Row #{x}"][[x,y+6]].icon} |"
			print " #{@board["Row #{x}"][[x,y+7]] == nil ? " " : @board["Row #{x}"][[x,y+7]].icon} |\n"
			print "|___|___|___|___|___|___|___|___|\n"
			
		end
	end

	def set_board
		@player_1.pieces.each_piece.each do |piece|
			# puts "PIECE:#{piece}\n\n"
			if !piece.nil?
				@board["Row #{piece.location[0]}"][piece.location] = piece
			end
		end
		@player_2.pieces.each_piece.each do |piece|
			# puts "PIECE:#{piece}\n\n"
			if !piece.nil?
				@board["Row #{piece.location[0]}"][piece.location] = piece
			end
		end
	end
end