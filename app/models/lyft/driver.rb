class Driver
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        save
    end

    def save
        self.class.all << self
    end

    def rides
        Ride.all.select {|ride| ride.driver == self}
    end

    def passengers
        rides.map {|ride| ride.rider}.uniq
    end

    def total_mileage
        rides.sum {|ride| ride.distance}
    end

    def self.all
        @@all
    end

    def self.mileage_cap(distance)
        self.all.select {|driver| driver.total_mileage > distance}
    end
end