class Movie
    attr_accessor :name,
    @@all = []

    def initialize
        @@all << self
    end

    def self.all
        @@all
    end
end

class Show
    attr_accessor :name,
    @@all = []

    def initialize
        @@all << self
    end

    def self.all
        @@all
    end
end

class Character
    attr_accessor :name, :actor, :movie, :show
    @@all = []

    def initialize
        @@all << self
    end

    def self.all
        @@all
    end
end

class Actor
    attr_accessor :name
    @@all = []

    def initialize
        @@all << self
    end

    def self.all
        @@all
    end
end