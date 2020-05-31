class Listing
    attr_accessor :city

    @@all = []

    def initialize(city)
        @city = city
        save
    end

    def save
        self.class.all << self
    end

    def self.all
        @@all
    end
end