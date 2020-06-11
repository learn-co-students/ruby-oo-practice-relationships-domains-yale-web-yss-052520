class Ride
    attr_reader :passenger, :driver, :distance

    @@all = []

    def initialize(passenger, driver, distance)
        @passenger = passenger
        @driver = driver
        @distance = distance
        self.class.all << self 
    end 

    def self.all
        @@all 
    end 

    def self.average_distance
        all.reduce(0.0) {|sum, ride| sum + ride.distance} / all.count
    end
    
end