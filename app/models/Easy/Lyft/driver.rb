class Driver

    @@all = []
      
    def initialize
        @@all << self
    end

    def passengers()
        rides.map{|ride| ride.passenger}
    end

    def mileage()
        rides().reduce(0){|total, ride| total + ride.distance()}
    end

    def rides()
        Ride.all().select{|ride| ride.driver == self}
    end

    def self.mileage_cap(distance)
        all().select{|driver| driver.mileage() > distance}
    end

    def self.all()
        @@all 
    end

end