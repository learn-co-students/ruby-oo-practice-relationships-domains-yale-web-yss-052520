class Contract

    @@all = []
    def initialize(location, trainer)
        @location = Location
        @trainer = Trainer
        @@all << self
    end

    def self.find_by_loc(location)
        all.select{|contract| contract.location == location}
    end

    def self.find_by_trainer(trainer)
        all.select{|contract| contract.trainer == trainer}
    end

    

    def self.all()
        @@all
    end
end