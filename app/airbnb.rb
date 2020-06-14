class Listing
    attr_reader  :city
    @@all = []
    def initialize(city)
        @city = city

        @@all << self
    end

    def trips
        Trip.all.select{|trip| trip.listing == self}
    end

    def guests
       trips.map(&:guest)
    end

    def self.find_all_by_city(city)
        all.select{|listing| listing.city == city}
    end

    def self.most_popular
        all.max{|listing| listing.trips.count}
    end

    def self.all
        @@all 
    end

end

class Guest

    attr_reader :name
    @@all = []
    def initialize(name)
        @name = name

        @@all << self
    end

    def trips
        Trip.all.select{|trip| trip.guest == self}
    end

    def guests
       trips.map(&:listing)
    end

    def trip_count
       trips.length 
    end

    # Class Methods
    def self.pro_traveller
        Guest.all.select{|guest| guest.trip_count > 1}
    end

    def self.find_all_by_name(name)
        Guest.all.select{|guest| guest.name == name}
    end

    def self.all
        @@all 
    end

end

class Trip

    attr_reader :listing, :guest
    @@all = []
    def initialize(listing, guest)
        @listing = listing
        @guest = guest

        @@all << self
    end

    def self.all
        @@all 
    end

end