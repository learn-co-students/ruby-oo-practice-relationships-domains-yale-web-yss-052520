class Trainer

    @@all = []

    def initialize
        @@all << self
    end

    def clients()
        Clients.all().select() {|client| client.trainer == self}
    end

    def work_for(location)
        Contract.new(location, self)
    end

    def self.all()
        @@all
    end

    def self.most_clients()
        all().max_by{|trainer| trainer.clients().count()}
    end
end