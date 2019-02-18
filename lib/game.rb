class Game
	attr_accessor :board, :player_1, :player_2, :p1_turn

	require './lib/board.rb'
	require './lib/human.rb'
	require './lib/computer.rb'


	def initialize(player_1, player_2 = "computer")
		@p1_turn = true
		player_1 == "computer" ? @player_1 = Computer.new(player_1, "O") : @player_1 = Human.new(player_1)
		player_2 == "computer" ? @player_2 = Computer.new(player_2) : @player_2 = Human.new(player_2)
		@board = Board.new
	end

	def round
		@board.display
		guess = who_is_playing.guess
		if !@board.column_full?("column_#{guess}")
			@board.place_piece(who_is_playing, guess)
		else
			puts "THIS COLUMN IS FULL\nPICK ANOTHER ONE\n\n"
			round
		end
	end

	def game_over?
		@board.four_in_a_row?
	end

	def player_wins
		return "#{who_is_playing.name.upcase} WINS!!!"
	end

	def no_more_turns
		return "THE BOARD IS FULL.\n\nGAME OVER"
	end

	def start
		until game_over? || @board.full?
			@p1_turn ? @p1_turn = false : @p1_turn = true
			round
		end
		@board.display
		@board.full? ? no_more_turns : player_wins
	end

	def who_is_playing
		@p1_turn ? @player_1 : @player_2
	end

end