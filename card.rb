class Card
  attr_reader :suit, :rank, :value

  def initialize(suit,rank)
    @suit = suit
    @rank = rank
    @value = rank.to_i > 0 ? rank.to_i : 10
  end

  def show
    "#{@rank} of #{@suit}, value #{@value}"
  end
end
