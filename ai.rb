class AI
    def initialize
        @secret_word = generate_word()
        @incorrect_letters = []
        @correct_letters = Array.new(secret_word.length).map { |element| element = "_"}
    end

    attr_reader :secret_word
    attr_accessor :incorrect_letters
    attr_accessor :correct_letters

    def feedback_giver(guessed_letter)
        if secret_word.include?(guessed_letter)
            instances_of_letters = (0...secret_word.length).find_all { |i| secret_word[i,1] == guessed_letter }
            instances_of_letters.each {|element| correct_letters[element] = guessed_letter  }
        else
            incorrect_letters.push(guessed_letter)
        end
    end

    private
    def generate_word()
        words = ["red","green","yellow","blue"]
        words.sample
    end
end

test_2 = AI.new
puts test_2.secret_word
test_2.feedback_giver("e")
p test_2.correct_letters