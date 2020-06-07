# A Client belongs to a Trainer. 
# A Trainer has many Clients
class Client 
    attr_reader :name
    attr_accessor :trainer 

    @@all = []

    def initialize(name)
        @name = name 
        self.class.all << self 
    end 

    def self.all
        @@all 
    end 

    def assign_trainer(trainer)
        self.trainer = trainer
    end 
end 

class Location  
    attr_reader :place
    attr_accessor :num_clients
    @@all = []

    def initialize(place)
        @place = place 
        @num_clients = 0
        self.class.all << self 
    end 

    def self.all
        @@all 
    end 

    def self.least_clients
        self.all.min_by {|location| location.num_clients}
    end 
end

class Trainer 
    attr_reader :name 
    @@all = []

    def initialize(name)
        @name = name 
        self.class.all << self 
    end 

    def self.all
        @@all 
    end 

    # For the one-many relationship between Trainer and Client 
    def clients 
        Client.all.select {|client| client.trainer == self}
    end 

    def self.most_clients 
        self.all.max_by {|trainer| trainer.clients.size}
    end 
end 

# Would this be disobeying the single source of truth by storing trainer info again?
# Only store the fact that a client has one trainer once????
# Could remove the trainer attribute here and get it through the associated client. 
class Session
    attr_reader :location, :client
    @@all = []

    def initialize(location, client)
        @location = location 
        location.num_clients += 1
        @client = client
        self.class.all << self 
    end 

    def self.all 
        @@all 
    end 
end