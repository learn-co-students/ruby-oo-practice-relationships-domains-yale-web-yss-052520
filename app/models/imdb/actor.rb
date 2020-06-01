class Actor
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
        Casting.all.select {|casting| casting.actor == self}
    end

    def characters
        castings.map {|casting| casting.character}.uniq
    end

    def char_count
        characters.count 
    end

    def self.all
        @@all
    end

    def self.most_characters
        self.all.max {|a,b| a.char_count <=> b.char_count}
    end
end