require_relative "ai.rb"
require_relative "display.rb"
require_relative "player.rb"

class Game
    include Display

    @@letters = "qwertyuiopasdfghjklzxcvbnm"

    def initialize
        @player = Player.new
        @ai = AI.new
    end

    def game()
        display_rules()
        until player.incorrect_letters.length == 7 || player.won == true
            incorrect_letters_guessed(player.incorrect_letters.join(", "))
            please_enter_your_guess()
            input = gets.chomp.downcase
            if input.length>1 || @@letters.include?(input) == false
                invalid_input()
                next
            else
                player.guess = input
            end
            if ai.secret_word.include?(player.guess)
                ai.correct_letters_feedback(player.guess)
                correct_guess(ai.correct_letters.join(" "))
            else
                player.incorrect_letters.push(player.guess)
                incorrect_guess()
                draw_hangman(player.incorrect_letters.length)
            end
            
            if ai.won?
                player.won = true
            end
        end

        if player.won==true
            congratulations_message(ai.secret_word)
        else
            game_over_message(ai.secret_word)
        end

        thanks_message()
    end

    private
    attr_accessor :player
    attr_accessor :ai
end

gamer = Game.new
gamer.game()

