# create files for your ruby classes in this directory
class Listing 
    @@all = []
    attr_accessor :city 

    def initialize(city)
        @city = city
        @@all << self
    end 

    def trips  
        Trip.all.select {|trip| trip.listing == self}
    end 

    def guests
        self.trips.map do |trip|
            trip.guest 
        end 
    end 

    def trip_count 
        self.trips.count 
    end 

    def self.all 
        @@all
    end 

    def self.find_all_by_city(city)
        @@all.select {|trip| trip.city == city}
    end 

    def self.most_popular 
        @@all.max_by {|place| place.trip_count}
    end 

end 

class Guest
    @@all = []
    attr_accessor :name 

    def initialize(name)
        @name = name
        @@all << self
    end 

    def trips
        Trip.all.select {|trip| trip.guest == self}
    end 
    
    def listings
        self.trips.map do |trip|
            trip.listing
        end 
    end 
    
    def trip_count 
        self.trips.count
    end 

    def self.all 
        @@all
    end 

    def self.pro_traveller 
        @@all.select {|guy| guy.trip_count > 1}
    end 

    def self.find_all_by_name(name)
        @@all.select {|guy| guy.name == name}
    end 
        

end 

class Trip 
    @@all = []
    attr_accessor :guest, :listing

    def initialize(guest, listing)
        @guest = guest
        @listing = listing 
        @@all << self 
    end 

    def self.all 
        @@all 

    end 

        

end 


class Bakery 
    @@all = []

    attr_accessor :name 

    def self.all
        @@all
    end 

    def initialize(name)
        @name = name
        @@all << self 
    end 
    
    def ingredients
        Ingredient.all.select do |ingr|
            ingr.dessert.bakery == self 
        end 
    end 

    def desserts 
        Dessert.all.select {|dess| dess.bakery == self}
    end 

    def average_calories
        self.ingredients.each do |elem|
            cals =  0 
            cals += elem.calories 
        end 
        cals /= self.ingredients.count 
        return cals 
    end 

    def shopping_list
        self.ingredients.join(", ")
    end 

end 

class Dessert 
    @@all = []
    attr_accessor :bakery, :name  

    def self.all 
        @@all 
    end 

    def initialize(name, bakery)
        @name = name 
        @bakery = bakery 
        @@all << self 
    end  

    def ingredients
        Ingredient.all.select {|dess| dess.dessert == self}
    end 

    def calories 
        ingredients.each do |ingr|
            cals = 0
            cals += ingr.calories 
        end 
        return calls 
    end  


end 

class Ingredient
    @@all = []
    attr_accessor :name, :dessert, :calories 

    def self.all
        @@all
    end  

    def initialize(name, dessert, calories)
        @dessert = dessert 
        @name = name 
        @calories = calories 
        @@all << self 
    end 

    def bakery 
        self.dessert.bakery 
    end 

end 

class Passenger 
    @@all = []
    attr_accessor :name 

    def initialize(name)
        @name = name 
        @@all << self
    end 

    def rides
        Ride.all.select {|ride| ride.passenger == self}
    end 

    def drivers 
        self.drivers.map do |ride|
            ride.driver
        end 
    end 

    def self.all 
        @@all
    end 

    def total_distance 
        self.rides.each do |ride|
            dist = 0 
            dist += ride.distance
        end 
        return dist 
    end 
    
    def self.premium_members
        @@all.select {|guy| guy.total_distance > 100}
    end 

end 

class Driver 
    @@all = []
    attr_accessor :name

    def initialize(name)
        @name = name 
        @@all << self
    end 

    def rides 
        Ride.all.select {|ride| ride.driver == self}
    end 

    def passengers 
        self.rides.map do |guy|
            guy.passenger
        end 
    end 

    def self.all
        @@all
    end 

    def self.mileage_cap(distance)
        @@all.each.select do |driver|
            driver.rides.each do |ride|
                dist = 0 
                dist += ride.distance
            end 
            dist > distance
        end 
    end 
        


end 

class Ride 
    @@all = []
    attr_accessor :distance, :passenger, :driver 
    
    def initialize(distance)
        @distance = distance 
        @@all << selfend 
    end 

    def self.average_distanc
        tot_dist = 0 
        @@all.each do |ride|
            tot_dist += ride.distance
        end 
        return tot_dist / @@all.count
    end 
            

        

end 