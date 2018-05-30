require 'spec_helper'

describe Deck do
  before :each do
     @deck = Deck.new
 end

 describe "#new" do
    it "returns a Deck object" do
        expect(@deck).to be_an_instance_of Deck
    end
  end

  describe "a deck" do
    it "has 52 cards" do
      expect(@deck.cards.size).to eq(52)
    end
  end

  describe "#deal" do
    it "returns a Card object" do
      expect(@deck.deal(1)[0]).to be_an_instance_of Card
    end
  end

  describe "#hit" do
    it "returns a Card object" do
      expect(@deck.hit).to be_an_instance_of Card
    end
    it "makes the deck have 1 less card" do
      @original_size = @deck.cards.size
      @deck.hit
      @new_size = @deck.cards.size
      expect(@original_size - @new_size).to eq(1)
    end
  end
end
