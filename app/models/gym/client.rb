class Client
    attr_accessor :name, :location, :trainer

    @@all = []

    def initialize(name)
        @name = name
        save
    end

    def save
        self.class.all << self
    end

    def assign_trainer(trainer, preferred_loc)
        self.trainer = trainer
        self.change_location(preferred_loc)
        "Congratulations #{self.name}! Your trainer is #{self.trainer.name}. Welcome!"
    end

    def has_trainer?
        self.trainer != nil
    end

    def change_location(location)
        if !self.has_trainer?
            return "You cannot choose a location without an assigned trainer."
        end
        self.location = location
        return "Your new location is #{self.location.name}."
    end

    def self.all
        @@all
    end
end