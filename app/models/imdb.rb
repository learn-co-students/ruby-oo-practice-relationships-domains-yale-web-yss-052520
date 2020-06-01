require 'pry'

class Production
    def characters 
        pairs = CharProd.all.select {|one_pair| one_pair.production == self}
        pairs.map {|one_pair| one_pair.character}
    end 

    def character_count 
        self.characters.size 
    end 

    def add_character(character_in)
        CharProd.new(character_in,self) 
    end 

    def actors 
        self.characters.map {|one_character| one_character.actor}.uniq 
    end 
end 

class Movie < Production 
    @@all = [] 
    def initialize(name)
        @name = name 
        @@all << self 
    end 
    attr_reader :name 
    def self.all 
        @@all 
    end  
    def self.most_actors 
        self.all.max(1) {|one_movie| one_movie.character_count}
    end 
end 

class Show < Production  
    @@all = [] 
    def initialize(name)
        @name = name 
        @@all << self 
    end 
    attr_reader :name 
    def self.all 
        @@all 
    end 
    def on_the_big_screen
        Movie.all.select {|one_movie| one_movie.name == self.name }
    end 
end 

class CharProd 
    @@all = [] 
    def initialize(character,production)
        @character = character 
        @production = production 
        @@all << self 
    end 
    attr_accessor :character, :production 
    def self.all 
        @@all 
    end 
end 


class Character 
    @@all = [] 
    def initialize(name, actor)
        @name = name 
        @actor = actor 
        @@all << self 
    end 
    attr_reader :name, :actor 
    def self.all 
        @@all 
    end 

    def productions 
        pairs = CharProd.all.select {|one_pair| one_pair.character == self}
        pairs.map {|one_pair| one_pair.production}
    end 

    def production_count 
        self.productions.size 
    end 

    def add_production(production_in)
        CharProd.new(self,production_in) 
    end 

    def self.most_appearances 
        @@all.max(1) {|one_character| one_character.production_count} 
    end 
end 

class Actor
    @@all = []
    def initialize(name)
        @name = name 
        @@all << self 
    end 
    attr_accessor :name 
    def self.all 
        @@all 
    end 

    def characters 
        Character.all.select {|one_character| one_character.actor == self }
    end 

    def character_count 
        self.characters.size 
    end 

    def self.most_characters 
        @@all.max(1) {|one_actor| one_actor.character_count}
    end 

end 

a1 = Actor.new("a1")
a2 = Actor.new("a2")

c1a1 = Character.new("c1a1", a1) 
c2a1 = Character.new("c2a2",a1)

c1a2 = Character.new("c1a2", a2) 
c2a2 = Character.new("c2a2", a2) 

mov1 = Movie.new("mov1")
mov2 = Movie.new("mov2")
show1 = Show.new("show1")
show2 = Show.new("show2")

mov1.add_character(c1a1)
c2a1.add_production(mov1)

show1.add_character(c1a1)
show2.add_character(c1a1)

mov3 = Movie.new("a")
mov4 = Movie.new("b")

show3 = Show.new("a")
show4 = Show.new("a")

puts c1a1.productions    



