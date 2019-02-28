class Game
	attr_accessor :board, :player_1, :player_2, :p1_turn

	require './lib/board.rb'
	require './lib/human.rb'
	require './lib/computer.rb'


	def initialize(player_1, player_2 = "computer")
		@p1_turn = true
		player_1 == "computer" ? @player_1 = Computer.new(player_1, "black") : @player_1 = Human.new(player_1, "black")
		player_2 == "computer" ? @player_2 = Computer.new(player_2, "red") : @player_2 = Human.new(player_2, "red")
		@board = Board.new(@player_1, @player_2)
	end

	def start
		until game_over? || @board.check?
			@board.display
			round
			@p1_turn ? @p1_turn = false : @p1_turn = true
		end
		@board.display
		@board.full? ? no_more_turns : player_wins
	end

	def round(move = nil)
		move.nil? ? move = who_is_playing.move : move
		# move = who_is_playing.move
		# puts "MOVE:#{move}"

		if my_piece?(move[0]) && !my_piece?(move[1]) && move_available?(move[0], move[1])
			@board.delete(move[1])
			@board.slider(move[0]).move_to(move[1])
			@board.delete(move[0])
			@board.set_board(who_is_playing)
			return @board.slider(move[1]) 
		else
			error
		end
	end

	def game_over?
		@board.checkmate?
		# true
	end

	def along_path?(location, destination)

	end

	def move_available?(location, destination)
		@board.slider(location).available_moves(destination) == destination ? true : false
	end

	def player_wins
		return "#{who_is_playing.name.upcase} WINS!!!"
	end

	def my_piece?(cell)
		(!@board.slider(cell).nil? && @board.slider(cell).color == who_is_playing.side_color) ? true : false
	end

	def error
		print who_is_playing.class == Human ? "THAT'S NOT A VALID MOVE" : ""
		round
	end

	def who_is_playing
		@p1_turn ? @player_1 : @player_2
	end

	def save_game

		Dir.mkdir("./file_save/") unless Dir.exists?("./file_save/")

		puts "Would you like to name your file? Y/N" 
		if gets.chomp.downcase[0] == "y"
			puts "Name your file."
			f_name = gets.chomp.downcase.split(" ").join("_").to_s
			filename = "file_save/#{f_name}_#{Time.new.usec}.yaml"
		else
			filename = "file_save/#{player.name.downcase}_#{Time.new.usec}.yaml"
		end

		# AREA FOR INPUTTING GAME SAVE CHARACTERISTICS

		data = YAML::dump ({
			:player_name => player.name,
			:past_guesses => board.past_letters,
			:board => board.body,
			:wrong => board.wrong_count,
			:board_secret => board.secret,
			:computer => computer.code,
			:round => round.round_number
		})

		File.open(filename, "w") { |file| file.puts data }

		puts "#{filename.split(".")[0].split("/")[1].upcase} SAVED!!!"
		exit
	end

	def load_game



		save_file = Dir.open("./file_save/")
		puts "\nCURRENT SAVES:\n"
		Dir.foreach(save_file) {|file| file.length > 5 ? print("    #{file.split(".")[0]}\n") : "" }
		puts "\nWhich file would you like to load?"
		previous_save = gets.chomp.split(" ").join("_").to_s

		if File.exist?("./file_save/#{previous_save}.yaml")
			data = YAML::load(File.read("./file_save/#{previous_save}.yaml"))

			# AREA FOR INPUTTING GAME SAVE CHARACTERISTICS
			
			player.name = data[:player_name]
			board.guessed = data[:past_guesses]
			board.body = data[:board]
			board.wrong_count = data[:wrong]
			computer.code = data[:computer]
			board.secret = data[:board_secret]
			round.round_number = data[:round]

			puts "\n\n\n\n#{board.display}\n#{previous_save.upcase} LOADED!!!\n\n"
			start_game
		else
			puts "\nFILE DOESN'T EXIST\n"
			load_game
		end
	end
end
