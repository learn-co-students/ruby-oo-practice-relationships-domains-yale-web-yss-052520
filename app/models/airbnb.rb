class Listing
    
    @@all = []
    attr_accessor :name, :city
    
    def initialize(name, city)
        @name = name
        @city = city
        @@all << self
    end
    
    def self.all
        @@all
    end

    def trips
        Trip.all.select{|trip|trip.listing == self}
    end

    def guests
        trips.map{|trip|trip.guest}.uniq
    end

    def self.find_all_by_city(city)
        self.all.select{|listing| listing.city == city}
    end

    def self.most_popular
        self.all.max_by{|listing| listing.trips.count}
    end
end

class Guest
   
    @@all = []
    attr_accessor :name 
   
    def initialize(name)
        @name = name
        @@all << self
    end
    
    def self.all
        @@all
    end

    def trips
        Trip.all.select{|trip|trip.guest == self}
    end

    def trip_count
        trips.count
    end

    def listings
        trips.map{|trip|trip.listing}.uniq
    end

    def self.pro_traveller
        self.all.select{|guest| guest.trip_count > 1}
    end

    def self.find_all_by_name(name)
        self.all.select{|guest|guest.name == name}
    end
end

class Trip
    
    @@all = []
    attr_accessor :listing, :guest
    
    def initialize(listing, guest)
        @listing = listing
        @guest = guest
        @@all << self
    end
    
    def self.all
        @@all
    end
end