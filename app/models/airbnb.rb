# Classic many to many example with Trip as a Joiner class

# Listing has many trips
class Listing 
    attr_reader :city 
    @@all = []

    def initialize(city)
        @city = city
        self.class.all << self 
    end 

    def self.all 
        @@all 
    end 

    def trips 
        Trip.all.select {|trip| trip.listing == self}
    end 

    def guests
        trips.map {|trip| trip.guest}
    end 

    def trip_count 
        trips.size 
    end 

    def self.find_all_by_city(city)
        self.all.select {|listing| listing.city == city}
    end

    def self.most_popular
        self.all.max_by {|listing| listing.trip_count}
    end 
end 

# Guest has many trips
class Guest
    attr_reader :name 
    @@all = []

    def initialize(name)
        @name = name 
        self.class.all << self 
    end 

    def self.all 
        @@all
    end 

    def trips 
        Trip.all.select {|trip| trip.guest == self}
    end 

    def listings 
        trips.map {|trip| trip.listing}
    end 

    def trip_count 
        trips.size 
    end 

    def self.pro_traveller
        self.all.select {|guest| guest.trip_count > 1}
    end

    def self.find_by_name(name)
        self.all.select {|guest| guest.name == name }
    end 
end 

# Trip belongs to a Listing and a Guest
class Trip 
    attr_reader :guest, :listing
    @@all = []

    def initialize(guest, listing)
        @guest = guest
        @listing = listing
        self.class.all << self
    end 

    def self.all 
        @@all 
    end 
end 