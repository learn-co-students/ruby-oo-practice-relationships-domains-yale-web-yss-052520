class Trainer
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        save
    end

    def save
        self.class.all << self
    end

    def clients
        Client.all.select {|client| client.trainer == self}
    end

    def locations
        clients.map {|client| client.location}.uniq
    end

    def self.all
        @@all
    end

    def self.most_clients
        self.all.max {|a,b| a.clients.count <=> b.clients.count}
    end
end