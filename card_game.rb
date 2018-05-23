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

  def value
    @value
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
  def initialize(name)
    @name = name
    @cards = []
  end

  def cards
    @cards
  end

  def cards=(cards)
    @cards = cards
    # p @cards
  end

  def show_hand
    puts "#{@name} #{@name == "You" ? "have" : "has"}"
    @cards.each { |card| puts card.show }
  end

  def hand_value
    sum = 0
    @cards.each { |card| sum += card.value }
    sum
  end
end

class Game
  def initialize
    @deck = Deck.new
    @player = Player.new "You"
    @dealer = Player.new "Dealer"
  end

  def deck
    @deck
  end

  def play
    @player.cards = @deck.deal(2)
    @player.show_hand
    puts @player.hand_value
    @dealer.cards = @deck.deal(2)
    @dealer.show_hand
    puts @dealer.hand_value
    if @dealer.hand_value == 21
      puts "Game over: Dealer has 21"
    else
      puts "Dealer does not have 21. Input 'hit' or 'stand'."
      input = "hit"
      while input != "stand" do
        input = gets.chomp
        if input.downcase == "hit"
          puts "you are hit"
        end
      end
    end
  end
end

game = Game.new
puts "Game ready!"
game.play
