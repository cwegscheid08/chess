class Game
	attr_accessor :board, :player_1, :player_2, :p1_turn

	require './lib/board.rb'
	require './lib/human.rb'
	require './lib/computer.rb'
	require 'yaml'


	def initialize(player_1, player_2 = "computer")
		@p1_turn = true
		player_1 == "computer" ? @player_1 = Computer.new(player_1, "black") : @player_1 = Human.new(player_1, "black")
		player_2 == "computer" ? @player_2 = Computer.new(player_2, "red") : @player_2 = Human.new(player_2, "red")
		@board = Board.new(@player_1, @player_2)
	end

	def start
		until game_over?
			@board.display
			round
			@p1_turn ? @p1_turn = false : @p1_turn = true
		end
		@board.display
		# @board.full? ? no_more_turns : player_wins
		player_wins
	end

	def round(move = nil)
		move.nil? ? move = who_is_playing.move : move
		# move = who_is_playing.move
		# puts "MOVE:#{move}"

		if my_piece?(move[0]) && !my_piece?(move[1]) && move_available?(move[0], move[1]) && !along_path?(@board.slider(move[0]), move[1])
			# !@board.slider(move[1]).nil? ? who_is_playing.pieces.each_piece.delete_if { |x| x == @board.slider(move[1])} : ""
			jump_piece(move[1])
			@board.delete(move[1])
			@board.slider(move[0]).move_to(move[1])
			@board.delete(move[0])
			@board.set_board(who_is_playing)
			return @board.slider(move[1]) 
		else
			error
		end
		print check? ? "\nYOU ARE IN CHECK!!!\n" : ""
	end

	def game_over?
		@board.checkmate?
		# true
	end

	def along_path?(piece, destination)
		# print "PIECE:#{piece}\n"
		# print "LOCATION:#{piece.location}\n"
		# print "NEXT AVAILABE MOVES:#{piece.available_moves(destination)}\n"
		# # print "NEXT AVAILABE MOVES:#{piece.available_moves(destination)}\n"
		# print "DESTINATION:#{destination}\n"
		# print "PIECE LOCATION[0]:#{piece.location[0]}---PIECE LOCATION[1]:#{piece.location[1]}\n"
		# print "DESTINATION[0]:#{destination[0]}---DESTINATION[1]:#{destination[1]}\n"

		piece.class == Knight ? (return false) : ""

		trail = []
		# tmp = [piece.location]
		tmp = []
		trail.push(piece.location)

		if piece.location[0] == destination[0] && piece.location[1] != destination[1]
			# print "DIRECTION LEFT TO RIGHT:#{left} #{right} TRAIL:#{trail.to_a} TMP:#{tmp.to_a} PIECE LOCATION#{piece.location}\n"
			
			if piece.location[1] < destination[1]
				# puts "RIGHT"
				8.times do 
					trail.push([trail[-1], right].transpose.map {|x| @board.slider(x.sum)})
					# puts "TRAIL:#{trail.to_a}"
					break if trail[-1] == destination
				end
			# elsif piece.location[1] > destination[1]
				puts "LEFT"
				8.times do
					trail.push([trail[-1], left].transpose.map {|x| @board.slider(x.sum)})
					# puts "TRAIL:#{trail.to_a}"
					break if trail[-1] == destination
				end
			end
		elsif piece.location[1] == destination[1] && piece.location[0] != destination[0]
			# print "DIRECTION UP TO DOWN:#{up} #{down} TRAIL:#{trail.to_a} TMP:#{tmp.to_a} PIECE LOCATION#{piece.location}\n"
			
			if piece.location[0] > destination[0]
				8.times do
					# puts "UP"
					trail.push([trail[-1], up].transpose.map {|x| x.sum})
					# puts "TRAIL:#{trail.to_a}"
					break if trail[-1] == destination
				end
			elsif piece.location[0] < destination[0]
				8.times do
					# puts "DOWN"
					trail.push([trail[-1], down].transpose.map {|x| x.sum})
					# puts "TRAIL:#{trail.to_a}"
					break if trail[-1] == destination
				end
			end
		elsif piece.location[0] < destination[0] && piece.location[1] > destination[1]
			# print "DIRECTION DOWN_LEFT:#{down_left} TRAIL:#{trail.to_a} TMP:#{tmp.to_a} PIECE LOCATION#{piece.location}\n"
			8.times do 
				trail.push([trail[-1], down_left].transpose.map {|x| x.sum})
				# puts "TRAIL:#{trail.to_a}"
				break if trail[-1] == destination
			end
		elsif piece.location[0] < destination[0] && piece.location[1] < destination[1]
			# print "DIRECTION DOWN_RIGHT:#{down_right} TRAIL:#{trail.to_a} TMP:#{tmp.to_a} PIECE LOCATION#{piece.location}\n"
			8.times do 
				trail.push([trail[-1], down_right].transpose.map {|x| x.sum})
				# puts "TRAIL:#{trail.to_a}"
				break if trail[-1] == destination
			end
		elsif piece.location[0] > destination[0] && piece.location[1] > destination[1]
			# print "DIRECTION UP_LEFT:#{up_left} TRAIL:#{trail.to_a} TMP:#{tmp.to_a} PIECE LOCATION#{piece.location}\n"
			8.times do 
				trail.push([trail[-1], up_left].transpose.map {|x| x.sum})
				# puts "TRAIL:#{trail.to_a}"
				break if trail[-1] == destination
			end
		elsif piece.location[0] > destination[0] && piece.location[1] < destination[1]
			# print "DIRECTION UP_RIGHT:#{up_right} TRAIL:#{trail.to_a} TMP:#{tmp.to_a} PIECE LOCATION#{piece.location}\n"
			8.times do 
				trail.push([trail[-1], up_right].transpose.map {|x| x.sum})
				# puts "TRAIL:#{trail.to_a}"
				break if trail[-1] == destination
			end
		end
		trail.shift
		
		# trail = []

		trail.map! {|x| @board.slider(x) }

		if !trail[-1].nil? && trail[-1].color != who_is_playing.side_color
			trail.pop
		end

		# puts "TRAIL:#{trail.to_a}"

		return trail.any? {|x| !x.nil? } ? true : false
	end

	def check?(cell = other_player.pieces.king.location)
		who_is_playing.pieces.each_piece.each do |piece|
			# along_path?(piece, other_player.pieces.king.location)
			# if (piece.available_moves(other_player.pieces.king.location) == other_player.pieces.king.location) && !along_path?(piece, other_player.pieces.king.location)
			if (piece.available_moves(cell) == cell) && !along_path?(piece, cell)
				return true
			end
		end
		false
	end

	def checkmate?
		other_player.pieces.king.move_type.each do |move|
			if other_player.pieces.king.available_moves(move) != other_player.pieces.king.location && check?(other_player.pieces.king.available_moves(move))
				return false
			end
		end
		true
	end

	def jump_piece(defense)
		!@board.slider(defense).nil? ? other_player.pieces.each_piece.delete(@board.slider(defense)) : ""
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
		print who_is_playing.class == Human ? "\nTHAT'S NOT A VALID MOVE\n" : ""
		round
	end

	def who_is_playing
		@p1_turn ? @player_1 : @player_2
	end

	def other_player
		@p1_turn ? @player_2 : @player_1
	end

	def up
		[-1,0]
	end

	def down
		[1,0]
	end

	def left		
		[0,-1]
	end

	def right
		[0,1]
	end

	def up_left
		[-1,-1]		
	end

	def up_right
		[-1,1]		
	end

	def down_right
		[1,1]
	end

	def down_left
		[1,-1]
	end

	def directions
		[up, down, left, right, up_left, up_right, down_left, down_right]
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
			:player_1 => @player_1,
			:player_2 => @player_2,
			:board => @board
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
			
			@player_1 = data[:player_1]
			@player_2 = data[:player_2]
			@board = data[:board]

			puts "\n\n\n\n#{board.display}\n#{previous_save.upcase} LOADED!!!\n\n"
			start
		else
			puts "\nFILE DOESN'T EXIST\n"
			load_game
		end
	end
end
