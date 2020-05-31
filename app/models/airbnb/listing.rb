class Listing
    attr_accessor :city

    @@all = []

    def initialize(city)
        @city = city
        save
    end

    def save
        self.class.all << self
    end

    def trips
        Trip.all.select {|trip| trip.listing == self}
    end

    def guests
        trips.map {|trip| trip.guest}
    end

    def trip_count
        trips.count 
    end

    def self.all
        @@all
    end

    def self.find_all_by_city(city)
        self.all.select {|listing| listing.city == city}
    end

    def self.most_popular
        self.all.max {|a, b| a.trip_count <=> b.trip_count}
    end
end