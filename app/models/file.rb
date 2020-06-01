# airbnb

class Listing
    attr_accessor :name, :city

    @@all = []

    def initialize(name, city)
        @name = name
        @city = city

        @@all << self
    end

    def self.all
        @@all
    end

    def trips
        Trip.all.select {|trip| trip.listing == self}
    end

    def guests
        trips.map {|trip| trip.guest}.uniq
    end

    def trip_count
        trips.count
    end

    def self.find_all_by_city(city)
        all.select {|listing| listing.city == city}
    end

    def self.most_popular
        all.reduce {|memo, listing| memo.trip_count > listing.trip_count ? memo : listing}
    end
end

class Guest
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name

        @@all << self
    end

    def self.all
        @@all
    end

    def trips
        Trip.all.select {|trip| trip.guest == self}
    end

    def listings
        trips.map {|trip| trip.listing}.uniq
    end

    def trip_count
        trips.count
    end

    def self.pro_traveller
        all.select {|guest| guest.trip_count > 1}
    end

    def self.find_all_by_name(name)
        all.select {|guest| guest.name == name}
    end
end

class Trip
    attr_accessor :date, :listing, :guest

    @@all = []

    def initialize(date, listing, guest)
        @guest = guest
        @listing = listing
        @date = date

        @@all << self
    end

    def self.all
        @@all
    end
end

# bakery

class Bakery
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def ingredients
        desserts.map {|dessert| dessert.ingredients}.flatten
    end

    def desserts
        Dessert.all.select {|dessert| dessert.bakery == self}
    end

    def average_calories
        desserts.reduce(0.0) {|sum, dessert| sum + dessert.calories} / desserts.count
    end

    def shopping_list
        ingredients.map {|ingredient| ingredient.name}.uniq
    end
end

class Dessert
    attr_accessor :name, :bakery

    @@all = []

    def initialize(name, bakery)
        @name = name
        @bakery = bakery

        @@all << self
    end

    def self.all
        @@all
    end

    def ingredients
        Ingredient.all.select {|ingredient| ingredient.dessert == self}
    end

    def calories
        ingredients.reduce(0) {|sum, ingredient| sum + ingredient.calories}
    end
end

class Ingredient
    attr_accessor :name, :calories, :dessert

    @@all = []

    def initialize(name, calories, dessert)
        @name = name
        @calories = calories
        @dessert = dessert

        @@all << self
    end

    def bakery
        dessert.bakery
    end

    def self.all
        @@all
    end

    def self.find_all_by_name(string)
        all.select {|ingredient| ingredient.name.include?(string)}
    end
end

# lyft

class Passenger
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name

        @@all << self
    end

    def self.all
        @@all
    end

    def drivers
        rides.map {|ride| ride.driver}.uniq
    end

    def rides
        Ride.all.select {|ride| ride.passenger == self}
    end

    def total_distance
        rides.reduce(0) {|sum, ride| sum + ride.distance}
    end

    def self.premium_members
        all.select {|member| member.total_distance > 100}
    end
end

class Driver
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name

        @@all << self
    end

    def self.all
        @@all
    end

    def rides
        Ride.all.select {|ride| ride.driver == self}
    end

    def passengers
        rides.map {|ride| ride.passenger}.uniq
    end

    def mileage
        rides.reduce(0) {|sum, ride| sum + ride.distance}
    end

    def self.mileage_cap(distance)
        all.select {|driver| driver.mileage > distance}
    end
end

class Ride
    attr_accessor :passenger, :driver, :distance

    @@all = []

    def initialize(passenger, driver, distance)
        @passenger = passenger
        @driver = driver
        @distance = distance

        @@all << self
    end

    def self.all
        @@all
    end

    def self.average_distance
        all.reduce(0.0) {|sum, ride| sum + ride.distance} / all.count
    end
end

# imdb

class Movie
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name

        @@all << self
    end

    def self.all
        @@all
    end

    def join_class_search(klass)
        klass.all.select {|member| member.movie == self}
    end

    def characters
        joinclass = join_class_search(MovieJoinCharacter)
        joinclass.map {|member| member.character}
    end

    def actors
        characters.map {|char| char.actor}.uniq
    end

    def self.most_actors
        all.max_by {|movie| movie.actors.count}
    end
end

class MovieJoinCharacter
    attr_accessor :movie, :character

    @@all = []

    def initialize(movie, character)
        @movie = movie
        @character = character

        @@all << self
    end

    def self.all
        @@all
    end
end

class Show
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name

        @@all << self
    end

    def self.all
        @@all
    end

    def join_class_search(klass)
        klass.all.select {|member| member.show == self}
    end

    def characters
        joinclass = join_class_search(ShowJoinCharacter)
        joinclass.map {|member| member.character}
    end

    def actors
        characters.map {|character| character.actor}.uniq
    end

    def on_the_big_screen
        Movie.all.find {|movie| movie.name == name}
    end
end

class ShowJoinCharacter
    attr_accessor :show, :character

    @@all = []

    def initialize(show, character)
        @show = show
        @character = character

        @@all << self
    end

    def self.all
        @@all
    end
end

class Character
    attr_accessor :name, :actor

    @@all = []

    def initialize(name, actor)
        @name = name
        @actor = actor

        @@all << self
    end

    def self.all
        @@all
    end
    
    def join_class_search(klass)
        klass.all.select {|member| member.character == self}
    end

    def movies
        joinclass = join_class_search(MovieJoinCharacter)
        joinclass.map {|member| member.movie}
    end

    def shows
        joinclass = join_class_search(ShowJoinCharacter)
        joinclass.map {|member| member.show}
    end

    def appearances
        movies.count + shows.count
    end

    def self.most_appearances
        all.max_by {|character| character.appearances}
    end
end

class Actor
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name

        @@all << self
    end

    def self.all
        @@all
    end

    def characters
        Character.all.select {|char| char.actor == self}
    end

    def self.most_characters
        all.max_by {|actor| actor.characters.count}
    end
end

# ExClass

class PasteThis
    attr_accessor

    @@all = []

    def initialize()


        @@all << self
    end

    def self.all
        @@all
    end
end

# TODO: crowdfunding, gym