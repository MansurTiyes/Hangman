require_relative "ai.rb"
require_relative "display.rb"
require_relative "player.rb"
require 'yaml'

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
            $/="\n"
            incorrect_letters_guessed(player.incorrect_letters.join(", "))
            please_enter_your_guess()
            input = gets.chomp.downcase
            if input=="save"
                saving_your_game()
                return
            elsif input=="load"
                load_game()
            else
                normal_game_round(input)
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

    def save_game(name_of_file)
        File.open("saved_games/#{name_of_file}.yaml",'w') do |file|
            file.puts YAML::dump(player)
            file.puts ""
            file.puts YAML::dump(ai)
        end
    end

    def unserializing_saved_games(name_of_file)
        array = []
        $/="\n\n"
        File.open(name_of_file, "r").each do |object|
            array.push(YAML.unsafe_load(object))
        end
        return array
    end

    def normal_game_round(input)
        if input.length>1 || @@letters.include?(input) == false
            invalid_input()
            return
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

    def saving_your_game()
        save_file_name()
        entered_name = gets.chomp
        if entered_name.include?(" ") || entered_name.include?(".")
            puts "Please enter possible name with no spaces or full stops"
            return
        end
        save_game(entered_name)
        puts "Succesfully saved the file"
        thanks_message()
    end

    def load_game()
        saved_files()
        saved_games = Dir.glob("saved_games/*")
        input_on_saved = gets.chomp.to_i
        if input_on_saved<1 || input_on_saved>saved_games.length
            puts "Please enter possible option"
            return
        end
        array = unserializing_saved_games(saved_games[input_on_saved-1])
        @player = array[0]
        player.guess = ""
        @ai = array[1]
    end
end

gamer = Game.new
gamer.game()


