class Passenger
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
        Ride.all.select {|ride| ride.rider == self}
    end

    def drivers
        rides.map {|ride| ride.driver}.uniq
    end

    def total_distance
        rides.sum {|ride| ride.distance}
    end

    def self.all
        @@all
    end

    def self.premium_members
        self.all.max {|a,b| a.total_distance <=> b.total_distance}
    end
end