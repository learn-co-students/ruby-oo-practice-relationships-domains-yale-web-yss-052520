class Passenger

    @@all = []
    def initialize
        
        @@all << self
    end

    def rides
        Ride.all.select{|ride| ride.passenger == self}
    end

    def drivers
       rides.map(&:driver) 
    end

    def total_distance
        rides.sum(&:distance)
    end

    
    def self.premium_members
        Passenger.all.select{|pass| pass.total_distance > 100}
    end

    def self.all
        @@all
    end
end

class Driver
    @@all = []
    def initialize
        
        @@all << self
    end

    def rides
        Ride.all.select{|ride| ride.driver == self}
    end

    def passengers
       rides.map(&:passenger) 
    end

    def sum_distance
        rides.sum(&:distance)
    end

    def self.mileage_cap(distance)
        Driver.all.select{|driver|  driver.sum_distance > distance}.uniq 
    end

    def self.all
        @@all
    end
end

class Ride
    attr_reader :distance, :passenger, :driver

    @@all = []
    def initialize(distance, passenger, driver)
        @distance = distance
        @passenger = passenger
        @driver = driver

        @@all << self
    end

    def self.all
        @@all
    end

    def self.average_distance
        Ride.all.sum(&:distance) / Ride.all.length
    end
end