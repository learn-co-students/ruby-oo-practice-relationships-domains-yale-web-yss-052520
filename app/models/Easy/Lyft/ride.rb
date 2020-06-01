class Ride
    attr_accessor :passenger, :driver, :distance
    @@all = []
    def initialize(args)
        args.each{|key, val| self.send(("#{key}="), val)}
        @@all << self
    end

    def self.all()
        @@all 
    end

    def self.average_distance()
        total_distance().to_f/self.all().count() 
    end

    private 

    def self.total_distance()
        self.all().reduce(0) {|total, ride| total + ride.distance}
    end

end