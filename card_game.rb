class Card
  def initialize(suit,rank)
    @suit = suit
    @rank = rank
  end

  def suit
    @suit
  end

  def rank
    @rank
  end
end

class Deck
  def initialize
    suits = ['Spades', 'Hearts', 'Diamonds', 'Clubs']
    ranks = ['1', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']
    @cards = []
     suits.each do |suit|
       ranks.each do |rank|
         @cards << Card.new(suit,rank)
       end
     end
     @cards.shuffle!
  end

  def cards
    @cards
  end

  def card(position)
    "#{@cards[position -1].rank} of #{@cards[position -1].suit}"
  end
end

class Game
  def initialize
    @deck = Deck.new
  end

  def deck
    @deck
  end
end

game = Game.new
puts game.deck.card 23
