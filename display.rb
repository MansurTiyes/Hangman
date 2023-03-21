module Display
    HANGMANPICS = ['''
        +---+
        |   |
            |
            |
            |
            |
      =========''', '''
        +---+
        |   |
        O   |
            |
            |
            |
      =========''', '''
        +---+
        |   |
        O   |
        |   |
            |
            |
      =========''', '''
        +---+
        |   |
        O   |
       /|   |
            |
            |
      =========''', '''
        +---+
        |   |
        O   |
       /|\  |
            |
            |
      =========''', '''
        +---+
        |   |
        O   |
       /|\  |
       /    |
            |
      =========''', '''
        +---+
        |   |
        O   |
       /|\  |
       / \  |
            |
      =========''']

    def draw_hangman(turn_number)
        puts HANGMANPICS[turn_number-1]
    end

    def display_rules()
        puts "Welcome to Hangman game!"
        puts "1. You must guess letters to uncover the hidden word, one letter at a time."
        puts "2. You can only guess one letter at a time, and each guess must be a letter of the alphabet (case-insensitive)."
        puts "3. If the letter you guess is in the hidden word, all instances of that letter will be revealed."
        puts "4. If the letter you guess is not in the hidden word, part of the hangman will be drawn."
        puts "5. You have a limited number of incorrect guesses before the hangman is fully drawn and the game is over."
        puts "6. If you correctly guess all the letters in the word before the hangman is fully drawn, you win the game. Good luck!"
    end

    def please_enter_your_guess()
        puts "Please input a letter to guess:"
    end

    def invalid_input()
        puts "Invalid input. Please enter a single letter of the alphabet."
    end

    def correct_guess(correct_letters_array)
        puts "Great job! The letter you guessed is in the hidden word." 
        puts "The word now looks like: #{correct_letters_array}."
    end

    def incorrect_guess()
        puts "Sorry, the letter you guessed is not in the hidden word. The hangman now looks like: "
    end

    def game_over_message(secret_word)
        puts "Game over! You have exceeded the maximum number of incorrect guesses. The hidden word was #{secret_word}"
    end

    def congratulations_message(secret_word)
        puts "Congratulations! You have correctly guessed the hidden word #{secret_word} and won the game."
    end

    def incorrect_letters_guessed(incorrect_letters)
        puts "Here are all the incorrectly guessed letters so far: #{incorrect_letters}"
    end

    def thanks_message()
        puts "Thanks for playing Hangman! Come back soon!"
    end

    def options()
        puts "You have following options: "
        puts "Enter 1 if you want to continue playing"
        puts "Enter 2 if you want to save and exit"
        puts "Enter 3 if you want to continue existing saved game file"
    end

    def save_file_name()
        puts "Please enter the name of your savefile (no spaces): "
    end

    def saved_files()
        puts "Here is the list of available saved files:"
        Dir.glob("saved_games/*").each_with_index do |fname, index|
            puts "#{index+1} : #{fname[12,50]}"
        end
    end
end

