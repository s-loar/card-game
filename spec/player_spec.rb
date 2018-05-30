require 'spec_helper'

describe Player do
  before :each do
    @card = Card.new "Hearts", "Queen"
    @player = Player.new("Dealer")
    @player.cards << @card
  end

  describe "#new" do
    it "takes one parameter and returns a Player object" do
      expect(@player).to be_an_instance_of Player
    end
  end

  describe "#show_hand" do
    it "should say 'Dealer has' and 'Queen of Hearts, value 10' when run" do
      expect(STDOUT).to receive(:puts).with('Dealer has')
      expect(STDOUT).to receive(:puts).with('Queen of Hearts, value 10')
      @player.show_hand
    end
  end

  describe "#show_random_card" do
    it "should say 'Queen of Hearts, value 10' when run" do
      expect(STDOUT).to receive(:puts).with('Queen of Hearts, value 10')
      @player.show_random_card
    end
  end

  describe "#hand_value" do
    it "should be 10" do
      expect(@player.hand_value).to eq 10
    end
  end
end
