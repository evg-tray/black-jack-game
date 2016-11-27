class Hand
  def initialize
    @cards = []
    @points = 0
  end

  def add_card(card)
    @cards << card
  end

  def cards(visible = false)
    message = ''
    @cards.each { |card| message << (visible ? card.to_s : '**-**') << ' ' }
    message
  end

  def points
    if @cards.detect { |card| card.points == 11 }
      count_aces = @cards.count { |card| card.points == 11 }
      @points = @cards.inject(0) { |sum, card| sum + card.points }
      count_aces.times do
        break if @points <= 21
        @points -= 10
      end
    else
      @points = @cards.inject(0) { |sum, card| sum + card.points }
    end
    @points
  end
end
