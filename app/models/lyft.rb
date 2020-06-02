# Has many through: Driver has many Passengers through Rides

# Passenger has many Rides
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
        rides.inject(0) {|sum, ride| sum + ride.distance}
    end 

    def self.premium_members
        self.all.select {|passenger| passenger.total_distance > 100}
    end 
end

# Driver has many Rides
class Driver
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
        Ride.all.select {|ride| ride.driver == self}
    end 

    def passengers
        rides.map {|ride| ride.passenger}
    end 

    def total_distance 
        rides.inject(0) {|sum, ride| sum + ride.distance}
    end 

    def self.mileage_cap(dist)
        self.all.select {|driver| driver.total_distance > dist}
    end 
end 

# Ride belongs to a passenger and a driver
class Ride
    attr_reader :passenger, :driver, :distance
    @@all = []

    def initialize(passenger, driver, distance)
        @passenger = passenger
        @driver = driver
        @distance = distance
        self.class.all << self 
    end 

    def self.average_distance
        # Just rounding it to two decimal places
        (self.all.inject(0) {|sum, ride| sum + ride.distance} / self.all.size.to_f).round(2)
    end 

    def self.all
        @@all 
    end 
end