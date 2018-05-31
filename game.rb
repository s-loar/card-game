require_relative 'card'
require_relative 'deck'
require_relative 'player'

class Game
  def initialize
    @deck = Deck.new
    @player = Player.new "You"
    @dealer = Player.new "Dealer"
  end

  def play
    @player.cards = @deck.deal(2)
    @player.show_hand
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
