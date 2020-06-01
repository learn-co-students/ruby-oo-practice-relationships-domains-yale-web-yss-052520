class Location
    @@all = []

    def initialize()
        @@all << self
    end

    def employ(trainer)
        Contract.new(self, trainer)
    end

    def clients()
        trainers().map{|trainer| trainer.clients()}.flatten()
    end

    def trainers()
        Contract.find_by_loc(self).map{|contract| contract.trainer}
    end

    def self.all()
        @@all 
    end

    def self.least_clients()
        all().min_by{|location| location.clients.count()}
    end
end