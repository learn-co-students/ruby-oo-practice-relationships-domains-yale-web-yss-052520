class Dessert
    attr_accessor :bakery

    @@all = []

    def initialize(bakery)
        @bakery = bakery
        save
    end

    def save
        self.class.all << self
    end

    def ingredients
        Ingredient.all.select {|ing| ing.dessert == self}
    end

    def calories
        ingredients.sum {|ing| ing.calorie_count}
    end

    def self.all
        @@all
    end
end