class TurnManager
    def initialize(players)
      @players = players.shuffle
    end
  
    def current_player
      @players[0]
    end
  
    def next
      @players.rotate!
    end
  end