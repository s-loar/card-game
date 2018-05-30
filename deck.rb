class Deck
  attr_reader :cards

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
