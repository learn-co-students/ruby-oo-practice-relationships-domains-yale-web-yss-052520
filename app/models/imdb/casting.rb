class Casting
    attr_reader :character, :production, :actor

    @@all = []

    def initialize(actor, character, production)
        @character = character
        @production = production
        @actor = actor
        save
    end

    def save
        self.class.all << self
    end

    def self.all
        @@all
    end
end