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
		@board.each do |key, value|
			puts "\nKEY:#{key} VALUE:#{value}\n"
			puts
		end
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