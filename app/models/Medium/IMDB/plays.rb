class Plays
    attr_accessor :movie, :show, :character
    @@all = []

    def initialize(args)
        args.each {|key, val| self.send(("#{key}="),val)}
        @@all << self
    end

    def self.find_by_name(name)
        all().select{|contract| contract.character.name == name}
    end

    def self.find_by_character(character)
        all().select{|contract| contract.character == character}
    end

    def self.find_by_movie(movie)
        all().select{|contract| contract.movie == movie}
    end

    def self.find_by_show(show)
        all().select{|contract| contract.show == show}
    end

    def self.all()
        @@all 
    end
end