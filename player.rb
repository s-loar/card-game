class Player
  attr_accessor :cards

  def initialize(name)
    @name = name
    @cards = []
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
