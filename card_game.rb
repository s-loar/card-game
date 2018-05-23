class Card
  def initialize(suit,rank)
    @suit = suit
    @rank = rank
    @value = rank.to_i > 0 ? rank.to_i : 10
  end

  def suit
    @suit
  end

  def rank
    @rank
  end

  def show
    "#{@rank} of #{@suit}, value #{@value}"
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
  def initialize(name, deck)
    @name = name
    @cards = deck.deal(5)
  end

  def cards
    @cards
  end

  def show_hand
    puts "#{@name} has"
    @cards.each { |card| puts card.show }
    puts
  end
end

class Game
  def initialize
    @deck = Deck.new
    @player1 = Player.new "Joe", @deck
    @player2 = Player.new "Jane", @deck
    @player3 = Player.new "Jake", @deck
    @player4 = Player.new "Tiny", @deck
  end

  def deck
    @deck
  end

  def play
    @player1.show_hand
    @player2.show_hand
    @player3.show_hand
    @player4.show_hand
  end

  def player1
    @player1
  end
  def player2
    @player2
  end
  def player3
    @player3
  end
  def player4
    @player4
  end
end

game = Game.new
puts "Game ready! The deck is shuffled and 4 players have 5 cards each."
game.play
