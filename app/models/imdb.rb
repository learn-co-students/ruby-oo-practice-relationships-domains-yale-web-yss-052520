class Movie
    attr_accessor :name
    @@all=[]
    def initialize(name)
        @name=name
        @@all << self
    end
    def self.all
        @@all
    end
    def appearances # returns all the appearances for this show
        Appearance.all.select{|app| app.project==self}
    end
    def characters # returns all the characters in the movie
        appearances.map{|app| app.character}
    end
    def actors # returns all the actors in a movie
        characters.map{|character| character.actor}
    end
    def self.most_actors
        @@all.max{|movie1, movie2| movie1.actors.length <=> movie2.actors.length}
    end
end

class Show #basically same as Movie class with different requested methods
    attr_accessor :name
    @@all=[]
    def initialize(name)
        @name=name
        @@all << self
    end
    def self.all
        @@all
    end
    def appearances # returns all the appearances for this show
        Appearance.all.select{|app| app.project==self}
    end
    def characters # returns all the characters in the movie
        appearances.map{|app| app.character}.uniq
    end
    def actors # returns all the actors in a movie
        characters.map{|character| character.actor}
    end
    def self.most_actors
        @@all.max{|movie1, movie2| movie1.actors.length <=> movie2.actors.length}
    end
    def on_the_big_screen
        Movie.all.select{|movie| movie.name==self.name}
    end
end

class Character
    attr_accessor :name, :actor
    @@all = []
    def initialize(name, actor)
        @name=name
        @actor=actor
        @@all << self
    end
    def appearances # returns all movies+shows in array
        Appearance.all.select{|appearance| appearance.character==self}
    end
    def self.most_appearances
        @@all.max{|character1, character2| character1.appearances.length <=> character2.appearances.length}
    end
    def self.all
        @@all
    end
end

class Appearance #joiner class bringing together Movie/Show and Character
    attr_accessor :name, :character, :project
    @@all = []
    def initialize(character, project)
        @character=character
        @project=project
        @@all << self
    end
    def self.all
        @@all
    end
end

class Actor
    attr_accessor :name
    @@all = []
    def initialize(name)
        @name=name
        @@all << self
    end
    def characters # all characters portrayed by actor
        Character.all.select{|character| character.actor==self}
    end
    def self.all
        @@all
    end
    def self.most_characters
        @@all.max{|actor1, actor2| actor1.characters.length <=> actor2.characters.length}
    end
end
