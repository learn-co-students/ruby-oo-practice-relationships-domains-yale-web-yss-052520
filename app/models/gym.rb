## I think I'm having some logic flaws regarding relationships between client and Location, and how to calculate which location has the least clients

class Trainer
    attr_reader :name
    @@all = []
    def initialize(name)
        @name=name
        @@all << self
    end
    def start_training(client)
        client.assign_trainer(self)
    end
    def clients
        Client.all.select{|client| client.trainer==self}
    end
    def worksites
        WorkSite.all.select{|worksite| worksite.trainer==self}
    end
    def locations
        worksites.map{|worksite| worksite.location}.uniq
    end
    def works_at(location)
        WorkSite.new(self, location)
    end
    def self.all
        @@all
    end
    def self.most_clients
        @@all.max{|trainer1, trainer2| trainer1.clients.length <=> trainer2.clients.length}
    end
end

class Location
    attr_reader :name
    @@all = []
    def initialize(name)
        @name=name
        @@all << self
    end
    def worksites
        WorkSite.all.select{|worksite| worksite.location==self}
    end
    def trainers
        worksites.map{|worksite| worksite.trainer}.uniq
    end
    def self.all
        @@all
    end
    def clients
        trainers.map{|trainer| trainer.clients}.flatten
    end
    def self.least_clients
        @@all.min{|loc1, loc2|loc1.clients.length <=> loc2.clients.length}
    end
end

class WorkSite # joiner class for Trainer and Location
    attr_reader :trainer, :location
    @@all = []
    def initialize(trainer, location)
        @trainer=trainer
        @location=location
        @@all << self
    end
    def self.all
        @@all
    end
end

class Client
    attr_reader :name, :trainer
    @@all = []
    def initialize(name)
        @name=name
        @@all << self
    end
    def assign_trainer(trainer)
        @trainer=trainer
    end
    def self.all
        @@all
    end
end

