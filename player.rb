class Player
    def initialize
        @guess = ""
        @incorrect_letters = []
        @won = false
    end

    attr_accessor :guess
    attr_accessor :won
    attr_accessor :incorrect_letters
end