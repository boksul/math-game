class Player
    attr_reader :name, :current_HP, :max_HP

    def initialize(name)
      @name = name
      @current_HP = 3
      @max_HP = 3
      @numbers = 20
    end

    def play()
      number1 = rand(@numbers) + 1
      number2 = rand(@numbers) + 1
      puts "#{@name}: What does #{number1} plus #{number2}?"
      print "> "
      anwser = gets.chomp.to_i

      if anwser == (number1 + number2)
        puts "#{@name}: YES! Block Successful!"
        return true
      else
        puts "#{@name}: Wrong! You Lose a Health Point!"
        @current_HP -= 1
        return false
      end
    end

    def dead?
      @current_HP <= 0
    end

    def summary
      "#{@name}: #{@current_HP}/#{@max_HP}"
    end
  end