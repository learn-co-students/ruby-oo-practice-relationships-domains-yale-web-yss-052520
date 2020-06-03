# Level: Easy
# All 3 classes are contained in this file for simplicity

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
       trips.map(&:guest)
    end

    def trip_count
        trips.count
    end

    def self.find_all_by_city(city)
        self.all.select {|listing| listing.city == city}
    end

    def self.most_popular
        self.all.max {|a,b| a.trip_count <=> b.trip_count}
    end

end

class Guest
    attr_reader :name
    @@all = []
    
    def initialize(name)
        @name=name
        self.class.all << self
    end

    def self.all 
        @@all
    end

    def trips
        Trip.all.select {|trip| trip.guest == self}
    end

    def listings
        trips.map(&:listing)
    end

    def trip_count
        trips.count
    end

    def self.pro_traveler
        self.all.select {|guest| guest.trip_count > 1 }
        # Guest.all.max {|a,b| a.trip_count <=> b.trip_count}
    end

    def self.find_all_by_name(name)
        self.all.select {|guest| guest.name == name}
    end
end

class Trip
    # this is the joiner method
    attr_reader :listing, :guest
    @@all = []

    def initialize (listing, guest)
        @listing=listing
        @guest= guest
        self.class.all << self
    end

    def self.all
        @@all
    end
end