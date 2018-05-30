require 'spec_helper'

describe Card do
  before :each do
     @card = Card.new "Hearts", "Queen"
 end

 describe "#new" do
    it "takes two parameters and returns a Card object" do
        expect(@card).to be_an_instance_of Card
    end
  end

  describe "#suit" do
    it "returns the correct suit"do
      expect(@card.suit).to eq "Hearts"
    end
  end

  describe "#rank" do
    it "returns the correct rank"do
      expect(@card.rank).to eq "Queen"
    end
  end

  describe "#value" do
    it "returns the correct value"do
      expect(@card.value).to eq 10
    end
  end

  describe "#show" do
    it "returns the correct value"do
      expect(@card.show).to eq "Queen of Hearts, value 10"
    end
  end
end
