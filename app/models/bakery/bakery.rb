class Bakery
    @@all = []

    def initialize
        save
    end

    def save
        self.class.all << self
    end

    def desserts
        Dessert.all.select {|d| d.bakery == self}
    end

    def ingredients
        desserts.map {|d| d.ingredients}.flatten
    end

    def self.all
        @@all
    end
end