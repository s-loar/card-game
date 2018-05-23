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

  def show
    "#{@rank} of #{@suit}"
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

  def deal(number_of_cards)
    cards = []
    (1..number_of_cards).each do #|i|
      cards << @cards.shift
    end
    cards
  end
end

class Player
  def initialize(deck)
    @cards = deck.deal(5)
  end

  def cards
    @cards
  end
end

class Game
  def initialize
    @deck = Deck.new
    # p @deck.cards[0].show
    @player1 = Player.new @deck
    @player2 = Player.new @deck
    @player3 = Player.new @deck
    @player4 = Player.new @deck
    # p @player1.cards[0].show
  end

  def deck
    @deck
  end
end

game = Game.new
puts "Game ready! The deck is shuffled and 4 players have 5 cards each."
