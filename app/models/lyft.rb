class Passenger
    attr_accessor :name
    @@all = []

    def initialize(name) 
        @name = name
        @@all << self
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
        rides.map {|ride| ride.distance}.sum
    end

    def self.premium_members
        self.all.select {|passenger| passenger.total_distance > 100}
    end
end 

class Driver
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name 
        @@all << self
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
        rides.map {|ride| ride.distance}.sum
    end

    def self.mileage_cap(distance)
        self.all.select {|driver| driver.total_distance > distance}
    end
end 

class Ride
    attr_accessor :passenger, :driver, :distance
    @@all = []

    def initialize(passenger, driver, distance)
        @passenger = passenger
        @driver = driver
        @distance = distance
        @@all << self
    end

    def self.all
        @@all 
    end

    def self.average_distance 
        self.all.reduce(0) {|sum, ride| sum + ride.distance} / self.all.count
    end
end 