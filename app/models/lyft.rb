class Passenger 
    @@all = []
    def initialize
        @@all << self 
    end 
    def self.all 
        @@all 
    end 

    def rides 
        Ride.all.select {|one_ride| one_ride.passenger == self}
    end 

    def drivers 
        self.rides.map {|one_ride| one_ride.driver}.uniq 
    end 

    def total_distance 
        self.rides.sum {|one_ride| one_ride.distance}
    end 

    def self.premium_members 
        @@all.select {|one_passenger| one_passenger.total_distance > 100}
    end 

end 

class Driver 
    @@all = []
    def initialize
        @@all << self 
    end 
    def self.all 
        @@all 
    end 

    def rides 
        Ride.all.select {|one_ride| one_ride.driver == self}
    end 

    def passengers 
        self.rides.map {|one_ride| one_ride.passenger}.uniq 
    end 

    def mileage
        self.rides.sum {|one_ride| one_ride.distance}
    end 

    def self.mileage_cap(cap_distance)
        @@all.select do |one_driver| 
            one_driver.mileage > cap_distance 
        end 
    end 
end 

#joiner class for Passenger, Driver
class Ride 
    @@all = []
    def initialize(passenger,driver, distance)
        @passenger = passenger
        @driver = driver
        @distance = distance.to_f
        @@all << self 
    end 
    attr_reader :passenger, :driver, :distance 
    def self.all
        @@all 
    end 
    def self.average_distance 
        sum_distance = @@all.sum {|one_ride| one_ride.distance} 
        sum_distance / @@all.size 
    end 
end 

pass1 = Passenger.new 
pass2 = Passenger.new 

driv1 = Driver.new 

driv2 = Driver.new 

r1 = Ride.new(pass1,driv1,100)
r1 = Ride.new(pass1,driv1,20)
r1 = Ride.new(pass1,driv1,50)

r1 = Ride.new(pass2,driv2,100)
r1 = Ride.new(pass2,driv2,2)
r1 = Ride.new(pass2,driv2,5)

puts Passenger.premium_members  
 