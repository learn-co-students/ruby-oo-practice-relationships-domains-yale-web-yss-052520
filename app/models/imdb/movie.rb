class Movie
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        save
    end

    def save
        self.class.all << self
    end

    def castings
        Casting.all.select {|casting| casting.production == self}
    end

    def actors
        castings.map {|casting| casting.actor}
    end

    def actor_count
        actors.count
    end

    def self.all
        @@all
    end

    def self.most_actors
        self.all.max {|a,b| a.actor_count <=> b.actor_count}
    end
end