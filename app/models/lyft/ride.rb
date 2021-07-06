class Ride
    attr_accessor :rider, :driver, :distance

    @@all = []

    def initialize(rider, driver, distance)
        @rider = rider
        @driver = driver
        @distance = distance
        save
    end

    def save
        self.class.all << self
    end

    def self.all
        @@all
    end

    def self.average_distance
        self.all.sum {|ride| ride.distance} / self.all.count
    end
end