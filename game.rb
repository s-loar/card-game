require_relative 'card'
require_relative 'deck'
require_relative 'player'

class Game
  def initialize
    @deck = Deck.new
    @player = Player.new "You"
    @dealer = Player.new "Dealer"
  end

  def game_over?(player_hand_value, dealer_hand_value)
    (dealer_hand_value >= 21 || player_hand_value >= 21) ? true : false
  end

  def declare_winner(player_hand_value, dealer_hand_value)
    if dealer_hand_value == 21 || player_hand_value > 21
      puts "Game over: Dealer wins."
    elsif player_hand_value == 21 || dealer_hand_value > 21
      puts "Game over: You win."
    elsif dealer_hand_value >= player_hand_value
      puts "Game over: Dealer wins."
    else
      puts "Game over: You win."
    end
  end

  def play
    @player.cards = @deck.deal(2)
    @player.show_hand
    @dealer.cards = @deck.deal(2)

    unless game_over?(@player.hand_value, @dealer.hand_value)
      puts "Dealer shows: "
      @dealer.show_random_card
      puts "No one has 21."
      input = "hit"
      while input != "stand" && @player.hand_value < 21 do
        puts "Input 'hit' or 'stand' to continue."
        input = gets.chomp
        if input.downcase == "hit"
          puts "you are hit"
          @player.cards << @deck.hit
          @player.show_hand
          puts "You have #{@player.hand_value} points"
        end
      end
      puts
      unless game_over?(@player.hand_value, @dealer.hand_value)
        puts "Dealer's turn now."
        while @dealer.hand_value < 16 do
          card = @deck.hit
          @dealer.cards << card
          puts "Dealer takes a card"
          puts card.show
        end
        @dealer.show_hand
        puts "Dealer has #{@dealer.hand_value} points"
      end
    end
    declare_winner(@player.hand_value, @dealer.hand_value)
  end
end
