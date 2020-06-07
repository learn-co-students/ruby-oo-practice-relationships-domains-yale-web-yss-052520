# has many characters
class Movie
    attr_reader :name 
    @@all = []

    def initialize(name)
        @name = name 
        @@all << self 
    end 
    
    def self.all 
        @@all 
    end 

    def roles 
        Role.all.select {|role| role.production == self}
    end 

    def characters 
        roles.map {|role| role.character}
    end

    def self.most_actors 
        self.all.max_by {|movie| movie.characters.size}
    end 
end 

# has many characters 
class Show
    attr_reader :name 
    @@all = []

    def initialize(name)
        @name = name 
        @@all << self 
    end 
    
    def self.all 
        @@all 
    end 

    def roles 
        Role.all.select {|role| role.production == self}
    end 

    def characters 
        roles.map {|role| role.character}
    end

    def on_the_big_screen 
        Movie.all.select {|movie| movie.name == self.name}
    end 
end 

# characters only have one actor          
# character has multiple shows/movies
class Character
    attr_reader :actor, :name 
    @@all = [] 

    def initialize(actor, name)
        @name = name
        @actor = actor 
        @@all << self 
    end 

    def self.all 
        @@all 
    end 

    def roles
        Role.all.select {|role| role.character == self}
    end

    # characters may have multiple movies or shows
    # this method gets all their movies/shows in an array and returns that array
    def productions
        roles.map {|role| role.production}
    end 

    # Should return which character of film/tv appears most in films or tv shows
    def self.most_appearances 
        self.all.max_by {|character| character.productions.size}
    end 
end 

# Create a new joiner class called Role
# Necessary because character has many movies/shows
# Production should be an instance of Show/Movie
class Role 
    attr_reader :character, :production 
    @@all = []

    def initialize(character, production)
        @character = character
        @production = production
        self.class.all << self 
    end 

    def self.all 
        @@all 
    end 
end 


# Actors has many characters 
# Character can only have one actor
class Actor 
    attr_reader :name 
    @@all  = []

    def initialize(name)
        @name = name 
        self.class.all << self 
    end 

    def self.all 
        @@all 
    end 

    # Returns number of characters played by this actor
    def num_characters
        Character.all.select {|character| character.actor == self}.size
    end 

    # Return actor that has most different characters portrayed
    def self.most_characters
        self.all.max_by {|actor| actor.num_characters}
    end 
end 