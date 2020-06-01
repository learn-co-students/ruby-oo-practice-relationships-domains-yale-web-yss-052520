class Client
    attr_accessor :trainer

    @@all = []
    def initialize
        @@all << self 
    end

    def assign_trainer(trainer)
        @trainer = trainer 
    end

    def locations()
        trainer().locations()
    end

    def self.all()
        @@all 
    end
end