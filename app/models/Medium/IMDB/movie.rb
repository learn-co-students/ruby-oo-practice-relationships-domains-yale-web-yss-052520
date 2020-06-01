class Movie
    attr_reader :name
    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end

    def self.most_actors()
        all.max_by{|movie| Plays.find_by_movie(movie)}
    end

    def hire(actor, charac_name)
        charac = Character.new({actor: actor, name: charac_name})
        Plays.new({movie: self, show: nil, character: charac})
    end

    def self.all()
        @@all 
    end
end
