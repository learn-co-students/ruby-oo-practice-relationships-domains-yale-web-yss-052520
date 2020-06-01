class Passenger

    @@all = []
    def initialize
        @@all << self
    end

    def drivers()
        rides().map{|ride| ride.driver}
    end

    def rides()
        Ride.all().select{|ride| ride.passenger == self}
    end

    def total_distance()
        rides().reduce(0) {|total, ride| total + ride.distance}
    end

    def self.all()
        @@all 
    end

    def self.premium_members()
        self.all().select{|passenger| passenger.total_distance() > 100}
    end
end