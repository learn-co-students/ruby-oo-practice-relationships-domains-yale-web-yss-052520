class Actor
    attr_reader :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def characters()
        Character.all().select{|charac| charac.actor == self}
    end

    def self.most_characters()
        all().max_by{|actor| actor.characters.count()}
    end

    def self.all()
        @@all 
    end
end