#Level: Medium

class Movie
    # have many characters
    attr_reader :title
    @@all= []

    def initialize(title)
        @title=title
        self.class.all << self
    end

    def self.all
        @@all
    end

    def self.most_actors
        # really hard!!

    end
end

class Show
    # have many characters
    attr_reader :title
    @@all=[]

    def initialize(title)
        @title=title
        self.class.all << self
    end

    def self.all
        @@all 
    end

    def on_the_big_screen
        Movie.all.select {|movie| movie.title == self.title}
    end
end

# class Episode
# end

class Character
    # has one actor, may have nultiple movies or shows, joiner?
    attr_reader :name, :movie, :show, :actor
    @@all=[]

    def initialize(name:, actor:, movie: nil, show:nil)
        # key value pair so that can have show without having to have movie
        @name=name
        @actor=actor
        @movie=movie
        @show=show
        self.class.all << self
    end

    def self.all
        @@all
    end

    def self.total_appearances
        # helped method created to assist the following method
        total = 0
        counter = 0 
        self.all.each {|character|
            if character.movie && character.show
                total += 2
            else 
                total +=1 
            end
            counter += 1
        }.count
    end
    
    def self.most_appearances
        # count up appearances and return max
        # really hard!!

    
    end
end

class Actor
    # have many characters
    attr_reader :name
    @@all=[]

    def initialize(name)
        @name=name
        self.class.all << self
    end

    def self.all
        @@all
    end

    def characters
        # helper method 
        # produces array of all character instances played by self
        Character.all.select {|character| character.actor==self}
    end

    def self.most_characters
        self.all.max {|a,b| a.characters.count <=> b.characters.count}
    end
end