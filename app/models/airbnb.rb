class Listing
    @@all = []
    attr_reader :name, :city 
    def initialize(name, city)
        @name = name 
        @city = city 
        @@all << self 
    end 
    def self.all 
        @@all 
    end 

    def trips 
        Trip.all.select {|one_trip| one_trip.listing == self} 
    end 

    def trip_count 
        self.trips.size 
    end 

    def guests 
        self.trips.map {|one_trip| one_trip.guest}.uniq 
    end 

    def self.find_all_by_city(city_in)
        @@all.select {|one_listing| one_listing.city == city_in}
    end 

    def self.most_popular 
        #written in case more than 1 listing has same number of max. trips
        most_pop = @@all.max(1) {|one_listing| one_listing.trip_count}
        @@all.select {|one_listing| one_listing.trip_count == most_pop[0].trip_count} 
    end 
end 

class Guest
    @@all = [] 
    attr_reader :name  
    def initialize(name)
        @name = name 
        @@all << self 
    end 
    def self.all 
        @@all 
    end 

    def trips 
        Trip.all.select {|one_trip| one_trip.guest == self }
    end 

    def trip_count 
        self.trips.size 
    end 

    def listings 
        self.trips.map {|one_trip| one_trip.listing}.uniq 
    end 

    def self.pro_traveller
        @@all.select {|one_guest| one_guest.trip_count >1}
    end 

    def self.find_all_by_name(name_in)
        @@all.select {|one_guest| one_guest.name == name_in}
    end 
end 

class Trip 
    @@all = []
    def initialize(guest,listing) 
        @guest = guest 
        @listing = listing 
        @@all << self 
    end 
    attr_reader :guest, :listing 
    def self.all 
        @@all 
    end 
end 

l1 = Listing.new("list1","place1")
l2 = Listing.new("list2","place2")
l3 = Listing.new("list3","place2")

g1 = Guest.new("guest1")
g2 = Guest.new("guest2")
g3 = Guest.new("guest3")

trip1 = Trip.new(g1,l1)
trip2 = Trip.new(g1,l2)
trip3 = Trip.new(g2,l1)
trip4 = Trip.new(g2,l2)
trip5 = Trip.new(g1,l2)
trip6 = Trip.new(g3,l1)

#tests for Listing class  
# puts l1.guests
# puts l2.trips 
# puts l1.trip_count 
# puts l3.trip_count 
# puts Listing.all 
# puts Listing.find_all_by_city("place1")
puts Listing.most_popular 

#tests for Trip class 
# puts trip1.guest
# puts trip1.listing 
# puts Trip.all  

#tests for Guest class 
# puts g1.listings 
# puts g1.trips 
# puts g2.trip_count 
# puts Guest.all 
# puts Guest.pro_traveller
# puts Guest.find_all_by_name("guest2")

