require_relative 'cards_deck'
class GameSet
  BET_SIZE = 10

  def initialize(first_player, second_player)
    @first_player = first_player
    @second_player = second_player
    @first_player.bet(BET_SIZE)
    @second_player.bet(BET_SIZE)
    @deck = CardsDeck.new
    take_start_cards
  end

  private
  
  def take_start_cards
    @cards_first_player = []
    @cards_second_player = []
    @cards_first_player << @deck.take_a_card
    @cards_second_player << @deck.take_a_card
    @cards_first_player << @deck.take_a_card
    @cards_second_player << @deck.take_a_card
  end
end
