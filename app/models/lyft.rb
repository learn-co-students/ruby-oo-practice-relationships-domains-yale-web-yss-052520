# Level: Easy

class Passenger
    # has many rides
    attr_reader :name
    @@all= []

    def initialize(name)
        @name=name
        self.class.all << self
    end

    def self.all
        @@all
    end

    def rides
        Ride.all.select {|ride| ride.passenger==self}
    end

    def drivers
        rides.map(&:driver)
    end

    def total_distance
        rides.flatten.map(&:distance).sum
    end

    def self.premium_members
        self.all.select {|passenger| passenger.total_distance > 100 }
    end

end

class Driver
    # has many rides
    attr_reader :name
    @@all= []

    def initialize(name)
        @name=name
        self.class.all << self
    end
    
    def self.all
        @@all
    end

    def rides
        Ride.all.select {|driver| driver.driver == self}
    end

    def passengers
        rides.map(&:passenger)
    end

    def total_milage 
        # made to assist the following method
        rides.sum {|ride| ride.distance} 
    end
    
    def self.mileage_cap(distance)
        self.all.select {|driver| driver.total_milage > distance}
    end
end

class Ride
    # belongs to passenger && driver, joiner method
    attr_reader :passenger, :driver, :distance
    @@all= []
    
    def initialize(passenger, driver, distance)
        @passenger=passenger
        @driver=driver
        @distance=distance
        self.class.all << self
    end

    def self.all
        @@all
    end

    def self.average_distance
        # total distance/num rides
        self.all.sum {|ride| ride.distance} / self.all.count
    end
end

