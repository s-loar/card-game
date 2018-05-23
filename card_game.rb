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
    puts "#{@rank} of #{@suit}, value #{@value}"
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
    (1..number_of_cards).each do
      cards << @cards.shift
    end
    cards
  end

  def hit
    @cards.shift
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
    @cards.each { |card| card.show }
  end

  def show_random_card
    @cards.sample.show
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
    # puts @player.hand_value
    @dealer.cards = @deck.deal(2)
    if @dealer.hand_value == 21
      puts "Game over: Dealer has 21. Dealer wins."
      @dealer.show_hand
    elsif @player.hand_value == 21
      puts "Game over: You have 21. You win."
    else
      puts "Dealer shows: "
      @dealer.show_random_card
      puts "No one has 21. Input 'hit' or 'stand' to continue."
      input = "hit"
      while input != "stand" && @player.hand_value < 21 do
        input = gets.chomp
        if input.downcase == "hit"
          puts "you are hit"
          @player.cards << @deck.hit
          @player.show_hand
        end
      end
      puts "You have #{@player.hand_value} points"
      if @player.hand_value > 21
        puts "Game over: Dealer wins"
      else
        # game continues for dealer
        puts "Dealer's turn now."
        while @dealer.hand_value < 16 do
          @dealer.cards << @deck.hit
        end
        @dealer.show_hand
        puts "Dealer has #{@dealer.hand_value} points"
        if @dealer.hand_value == 21
          puts "Game over: Dealer wins"
        elsif @player.hand_value == 21 || @dealer.hand_value > 21
          puts "Game over: You win"
        else
          if @dealer.hand_value >= @player.hand_value
            puts "Game over: Dealer wins"
          else
            puts "Game over: You win"
          end
        end
      end
    end
  end
end

game = Game.new
puts "Game ready!"
game.play
