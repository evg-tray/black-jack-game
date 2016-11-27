require_relative 'cards_deck'
require_relative 'hand'
require_relative '../core_ext/string/colorize'

class GameSet
  BET_SIZE = 10

  def initialize(human, dealer)
    @human = human
    @dealer = dealer
    @human.bet(BET_SIZE)
    @dealer.bet(BET_SIZE)
    @bank = BET_SIZE * 2
    @deck = CardsDeck.new
    @human_hand = Hand.new
    @dealer_hand = Hand.new
    take_start_cards
    print_info
    start_set
  end

  private

  def print_info(show_dealer = false)
    puts "Dealer: #{@dealer_hand.cards(show_dealer)}," \
      " Points: #{show_dealer ? @dealer_hand.points : '**'}"
    puts "You: #{@human_hand.cards(true)} Points: #{@human_hand.points}"
  end

  def start_set
    human_points = @human_hand.points
    dealer_points = @dealer_hand.points
    if human_points == 21
      puts 'You have the Black Jack!'.green
      if dealer_points == 21
        puts 'Dealer have the Black Jack!'.green
      else
        dealer_turn
      end
      result
    else
      human_turn
    end
  end

  def human_turn
    puts 'Your turn:'.green
    puts '1. Check'
    puts '2. Take a card'
    loop do
      command = gets.chomp.to_i
      case command
      when 1
        dealer_turn
        result
        break
      when 2
        @human_hand.add_card(@deck.take_a_card)
        dealer_turn
        result
        break
      else
        puts 'Error, enter again:'.red
      end
    end
  end

  def dealer_turn
    @dealer_hand.add_card(@deck.take_a_card) if @dealer_hand.points < 21
  end

  def result
    print_info(true)
    human_points = @human_hand.points
    dealer_points = @dealer_hand.points
    if human_points == @dealer_hand.points
      puts 'Draw!'
      @human.add_cash(@bank / 2)
      @deaker.add_cash(@bank / 2)
    elsif human_points == 21
      human_win
    elsif dealer_points == 21
      dealer_win
    elsif human_points < 21 || dealer_points < 21

      if human_points < 21 && dealer_points < 21

        if human_points > dealer_points
          human_win
        else
          dealer_win
        end

      elsif human_points < 21 && dealer_points > 21
        human_win
      else
        dealer_win
      end

    else
      if human_points < dealer_points
        human_win
      else
        dealer_win
      end
    end
  end

  def human_win
    puts 'You WIN!'.green
    @human.add_cash(@bank)
  end

  def dealer_win
    puts 'Dealer WIN!'.green
    @dealer.add_cash(@bank)
  end

  def take_start_cards
    2.times do
      @human_hand.add_card(@deck.take_a_card)
      @dealer_hand.add_card(@deck.take_a_card)
    end
  end
end
