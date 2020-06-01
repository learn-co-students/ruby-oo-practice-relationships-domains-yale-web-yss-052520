class Passenger
    attr_accessor :name
    @@all = []
    def initialize(name)
        @name=name
        @@all << self
    end
    def rides
        Ride.all.select{|ride| ride.passenger==self}
    end
    def drivers
        rides.map {|ride| ride.driver}.uniq
    end
    def total_distance
        rides.reduce(0) {|distance, ride| distance+=ride.distance}
    end
    def self.all
        @@all
    end
    def self.premium_members
        @@all.select {|passenger| passenger.total_distance>100.0}
    end
end

class Driver
    attr_accessor :name
    @@all = []
    def initialize(name)
        @name=name
        @@all << self
    end
    def rides
        Ride.all.select{|ride| ride.driver==self}
    end
    def passengers
        rides.map{|ride| ride.passenger}.uniq
    end
    def self.all
        @@all
    end
    def total_distance
        rides.reduce(0){|distance, ride| distance+=ride.distance}
    end
    def self.mileage_cap(distance)
        @@all.select{|driver| driver.total_distance>distance}
    end
end

class Ride
    attr_accessor :distance, :driver, :passenger
    @@all = []
    def initialize(passenger, driver, distance)
        @passenger=passenger
        @driver=driver
        @distance=distance
        @@all << self
    end
    def self.average_distance
        @@all.reduce(0){|total, ride| total+=ride.distance}/@@all.length
    end
    def self.all
        @@all
    end
end