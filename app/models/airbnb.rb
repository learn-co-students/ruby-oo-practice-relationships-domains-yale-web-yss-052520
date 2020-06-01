class Listing
    attr_accessor :city
    @@all = []
    def initialize(city)
        @city=city
        @@all << self
    end
    def trips
        Trip.all.select{|trip| trip.listing==self}
    end
    def guests
        trips.map{|trip| trip.guest}.uniq
    end
    def trip_count
        trips.count
    end
    def self.all
        @@all
    end
    def self.find_all_by_city(city)
        @@all.select{|listing| listing.city==city}
    end
    def self.most_popular
        @@all.max{|listinga, listingb| listinga.trip_count <=> listingb.trip_count}
    end
end

class Guest
    attr_accessor :name
    @@all = []
    def initialize(name)
        @name=name
        @@all << self
    end
    def listings
        trips.map{|trip| trip.listing}.uniq
    end
    def trips
        Trip.all.select{|trip| trip.guest==self}
    end
    def trip_count
        trips.count
    end
    def self.all
        @@all
    end
    def self.pro_traveler
        @@all.each_with_object([]) do |guest, pro_array|
            if guest.trip_count>1
                pro_array << guest
            end
        end
    end
    def self.find_all_by_name(name)
        @@all.select{|guest| guest.name==name}
    end
end

class Trip
    attr_accessor :guest, :listing
    @@all = []
    def initialize(guest, listing)
        @guest=guest
        @listing=listing
        @@all << self
    end
    def self.all
        @@all
    end
end