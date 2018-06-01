require 'spec_helper'

describe Game do
  before :each do
    @game = Game.new
  end

  describe "#new" do
    it "returns a Game object" do
      expect(@game).to be_an_instance_of Game
    end
  end

  describe "#game_over?" do
    it "is over when the player has 21 or more points" do
      game_over = @game.game_over?(21,0)
      # expect(STDOUT).to receive(:puts).with('Game over: You have 21. You win.')
      expect(game_over).to be true
    end
    it "is over when the dealer has 21 or more points" do
      game_over = @game.game_over?(0,21)
      expect(game_over).to be true
    end
    it "is not over when neither the dealer or player has 21 or more points" do
      game_over = @game.game_over?(10,10)
      expect(game_over).to be false
    end
  end

  describe "#declare_winner" do
    it "declares the Player as the winner when they get 21 points" do
      expect(STDOUT).to receive(:puts).with('Game over: You win.')
      @game.declare_winner(21, 10)
    end
    it "declares the Player as the winner when the Dealer has over 21 points" do
      expect(STDOUT).to receive(:puts).with('Game over: You win.')
      @game.declare_winner(10, 25)
    end
    it "declares the Player as the winner when they have more points" do
      expect(STDOUT).to receive(:puts).with('Game over: You win.')
      @game.declare_winner(18, 17)
    end
    it "declares the Dealer as the winner when they get 21 points" do
      expect(STDOUT).to receive(:puts).with('Game over: Dealer wins.')
      @game.declare_winner(10, 21)
    end
    it "declares the Dealer as the winner when the Player has over 21 points" do
      expect(STDOUT).to receive(:puts).with('Game over: Dealer wins.')
      @game.declare_winner(23, 10)
    end
    it "declares the Dealer as the winner when they have more points" do
      expect(STDOUT).to receive(:puts).with('Game over: Dealer wins.')
      @game.declare_winner(17, 18)
    end
  end
end
