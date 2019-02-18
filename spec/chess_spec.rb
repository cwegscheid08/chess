require './lib/game.rb'
require './lib/board.rb'
require './lib/human.rb'
require './lib/computer.rb'
require './lib/game_pieces.rb'
require './lib/knight.rb'



RSpec.describe Human do
	before do
		@human = Human.new("Chris", "Black")
	end

	context "Sets a new human players with the name Chris" do
		describe "#name" do
			it "returns the player's name." do
				expect(@human.name).to eql("Chris")
			end

			it "returns the player's side_color." do
				expect(@human.side_color).to eql("Black")
			end
		end

		describe "#move" do
			context "should move a game piece to one it's next AVAILABLE jumps" do
				it "returns true if that piece can move to that space next." do
					expect(@human.move(knight_1, [0,2])).to be_truthy
				end

				it "retuns false if that piece can't move to that space next." do
					expect(@human.move(queen, [2,0])).to eql(false)
				end
			end
		end



	end
end



RSpec.describe Computer do
	before do
		@computer = Computer.new("Red")
	end

	context "This represents a computer player." do
		describe "#name" do
			it "returns the name of the computer name." do
				expect(@computer.name).to eql("computer")
			end
		end

		describe "#side_color" do
			it "returns the side_color of the player." do
				expect(@computer.side_color).to eql("Red")
			end
		end

		describe "#move" do
			it "returns true if the game piece is able to make that move." do
				expect(@computer.move(bishop_2, [4,3])).to eql(false)
			end

			it "returns false if the game piece is not able to make that move." do
				expect(@computer.move(pawn_1, [0,3])).to eql(true)
			end
		end

		describe "#randomizer" do
			it "returns a game_piece and a move to one of it's next available jumps." do 
				expect(@computer.randomizer).to eql(bishop_2, [4,3])
			end
		end
	end
end



RSpec.describe Game do 
	before do
		@game = Game.new("computer")
	end

	context "This is a preset game between two seperate Computer players for a simulated game." do
		describe "#who_is_playing?" do
			it "returns the player object based on whose turn it is." do
				expect(@game.player_1.class).to eql(Computer)
			end
		end

		describe "#game_over?" do
			it "returns false if the game has not been won yet." do
				expect(@game.game_over?).to eql(false)
			end

			it "return true if the game has been won." do
				game.start
				expect(@game.game_over?).to eql(true)
			end
		end



	end
end



RSpec.describe Board do
	before do
		@board = Board.new
	end

	context "This object is a 8x8 matrix representing a chess board." do
		# describe "#display" do
		# 	it "display's the board data into a human readable chess board." do
		# 		expect(@board.display).to eql(

		# 			# BUILD BOARD DISPLAY IN HERE

		# 			)
		# 	end
		# end



	end
end



RSpec.describe GamePieces do
	before do
		@game_pieces = GamePieces.new
	end

	# context "Parent class containing methods for each individual game piece." do
	# 	describe "# " do

	# 	end
	# end
end