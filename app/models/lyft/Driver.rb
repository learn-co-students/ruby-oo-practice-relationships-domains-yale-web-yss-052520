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
        rides.map {|ride| ride.passenger}.uniq
    end

    def total_distance 
        rides.inject(0) {|sum, ride| sum + ride.distance}
    end 

    def self.mileage_cap(distance)
        all.select {|driver| driver.mileage > distance}
    end

end