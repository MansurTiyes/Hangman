class AI
    def initialize
        @secret_word = generate_word()
        @correct_letters = Array.new(secret_word.length).map { |element| element = "_"}
    end

    attr_reader :secret_word
    attr_accessor :correct_letters

    def correct_letters_feedback(guessed_letter)
        instances_of_letters = (0...secret_word.length).find_all { |i| secret_word[i,1] == guessed_letter }
        instances_of_letters.each {|element| correct_letters[element] = guessed_letter  }
    end

    def won?
        if correct_letters.join == secret_word
            return true
        else
            return false
        end
    end

    private
    def generate_word()
        words = ["red","green","yellow","blue"]
        words.sample
    end
end

