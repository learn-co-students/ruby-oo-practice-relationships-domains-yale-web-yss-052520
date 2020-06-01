class Show
    attr_reader :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def on_the_big_screen()
        Movie.all().select{|movie| movie.name == self.name}
    end

    def hire(actor, charac_name)
        charac = Character.new({actor: actor, name: charac_name})
        Plays.new({movie: nil, show: self, character: charac})
    end

    def self.all()
        @@all 
    end
end

