class Show
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

    def on_the_big_screen
        Movie.all.select {|movie| movie.name == self.name}
    end

    def self.all
        @@all
    end
end