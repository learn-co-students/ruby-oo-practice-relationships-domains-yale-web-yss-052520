class Location
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
        Client.all.select {|client| client.location == self}
    end

    def trainers
        clients.map {|client| client.trainer}.uniq
    end

    def self.all
        @@all
    end

    def self.least_clients
        self.all.min {|a, b| a.clients <=> b.clients}
    end
end