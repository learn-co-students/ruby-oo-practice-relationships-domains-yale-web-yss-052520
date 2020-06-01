class Character
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
        Casting.all.select {|casting| casting.character == self}
    end

    def actor
        castings[0].actor
    end

    def movies
        castings.select {|casting| casting.production.class == Movie}.map {|casting| casting.production}
    end

    def shows
        castings.select {|casting| casting.production.class == Show}.map {|casting| casting.production}
    end

    def production_count
        castings.count
    end

    def self.all
        @@all
    end

    def self.most_appearances
        self.all.max {|a,b| a.production_count <=> b.production_count}
    end
end