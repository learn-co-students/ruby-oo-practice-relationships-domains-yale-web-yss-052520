
class Location 
    @@all = [] 
    def initialize(name)
        @name = name 
        @@all << self 
    end 
    def self.all 
        @@all 
    end 

    def trainers 
        pairs = LocTrainer.all.select {|one_pair| one_pair.location == self } 
        pairs.map { |one_pair| one_pair.trainer}.uniq 
    end 

    def clients 
        self.trainers.map {|one_trainer| one_trainer.clients }.flatten.uniq 
    end 

    def num_clients 
        self.clients.size 
    end 

    def self.least_clients 
        @@all.min(1) {|one_client| one_client.num_clients }
    end 
end 


class LocTrainer
    @@all = [] 
    def initialize (location, trainer)
        @location = location 
        @trainer = trainer 
        @@all << self 
    end 
    attr_reader :location, :trainer 
    def self.all 
        @@all 
    end 
end 

class Trainer 
    @@all = [] 
    def initialize(name)
        @name = name 
        @@all << self 
    end 
    def self.all 
        @@all 
    end 
    attr_reader :name 

    def locations 
        pairs = LocTrainer.all.select {|one_pair| one_pair.trainer == self }
        pairs.map {|one_pair| one_pair.location}.uniq 
    end 

    def clients 
        Client.all.select {|one_client| one_client.trainer == self }
    end 

    def clients_number 
        self.clients.size 
    end 

    def self.most_clients 
        @@all.max(1) {|one_trainer| one_trainer.clients_number}
    end 
end 


class Client 
    @@all = [] 
    def initialize(name, trainer = nil)
        @name = name 
        @trainer = nil 
        @@all << self 
    end 
    attr_accessor :name, :trainer 
    def self.all 
        @@all 
    end 

    def assign_trainer(trainer_in)
        self.trainer = trainer_in
    end 

    def locations 
        self.trainer.locations 
    end 
end 

l1 = Location.new("l1")
l2 = Location.new("l2")

t1 = Trainer.new("t1")
t2 = Trainer.new("t2")

l1t1 = LocTrainer.new(l1, t1)
l2t2 = LocTrainer.new(l2, t2)

client1 = Client.new("c1")
client2 = Client.new("c2")
client3 = Client.new("c3")
client4 = Client.new("c4")

client1.assign_trainer (t1)
client2.assign_trainer (t1)
client3.assign_trainer (t1)
client4.assign_trainer (t2)


puts Trainer.most_clients  

