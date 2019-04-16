require './player.rb'
require './turn_manager.rb'

class Game

  def initialize
    puts "Welcome to the GAME of NUMBERS"
    sleep 1.5
    puts "Enter the name of Player1"
    print "> "
    player1 = Player.new(gets.chomp)
    sleep 1.0
    puts
    puts "Enter the name of player2"
    print "> "
    player2 = Player.new(gets.chomp)
    sleep 1.0

    @player = [player1, player2]
    @turn_manager = TurnManager.new(@player)
  end

  def play
    while not game_over?
      current_player = @turn_manager.current_player
      puts "Good Luck!"
      sleep 1.0

      puts "#{current_player.name}'s turn\n"
      sleep 1.0

      current_player.play()

      if current_player.current_HP > 0
        print_summary
        sleep 1.0
        puts "\n----- NEXT MATCH -----"
        sleep 1.0
      else
        puts "\n#{@last_player_name} wins with a score of #{@last_player_HP}/#{@last_player_mHP}"
        puts "----- GAME OVER -----"
        puts "Go Back to Elementary School!"
      end

      @last_player_name = current_player.name
      @last_player_HP = current_player.current_HP
      @last_player_mHP = current_player.max_HP

      swap_players
      sleep 1.0

    end
  end

  def game_over?
    @player.any? { |r| r.dead? }
  end

  def swap_players
    @turn_manager.next
  end

  def print_summary
    puts "#{@player[0].summary} vs #{@player[1].summary}"
  end
end