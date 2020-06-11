class Passenger
    attr_reader :name 
    @@all = []

    def initialize(name)
        @name = name 
        self.class.all << self 
    end 

    def self.all
        @@all 
    end 

    def rides 
        Ride.all.select {|ride| ride.passenger == self}
    end 

    def drivers 
        rides.map {|ride| ride.driver}
    end 

    def total_distance
        rides.reduce(0) {|sum, ride| sum + ride.distance}
    end

    def self.premium_members
        self.all.select {|m| m.total_distance > 100}
    end 
    
end