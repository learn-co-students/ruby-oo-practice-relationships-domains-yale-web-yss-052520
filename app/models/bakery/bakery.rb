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

    def average_calories
        sum = 0
        desserts.each {|d| sum += d.calories}
        sum / desserts.count
    end

    def shopping_list
        ingredients.map {|ing| ing.name}
    end

    def self.all
        @@all
    end
end