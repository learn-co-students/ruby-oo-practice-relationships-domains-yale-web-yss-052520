class Bakery
    @@all = []
    attr_accessor :name
    
    def initialize(name)
        @name = name
        @@all << self
    end
    
    def self.all
        @@all
    end

    def desserts
        Dessert.all.select{|dessert|dessert.bakery == self}
    end

    def ingredients
        desserts.map {|dessert| dessert.ingredients}.flatten
    end

    def average_calories
        desserts.sum{|dessert|dessert.calories} / desserts.count
    end

    def shopping_list
        ingredients.map {|ingredient| ingredient.name}
    end
end


class Dessert
    @@all = []
    attr_accessor :bakery, :name
    
    def initialize(name, bakery)
        @name = name
        @bakery = bakery
        @@all << self
    end
    
    def self.all
        @@all
    end

    def ingredients
        Ingredient.all.select{|ingredient|ingredient.dessert == self}
    end

    def calories
        ingredients.reduce(0) {|sum, ingredient| sum + ingredient.calories}
    end

end


class Ingredient
    @@all = []
    attr_accessor :dessert, :calories, :name
    
    def initialize(name, calories, dessert)
        @name = name
        @calories = calories
        @dessert = dessert
        @@all << self
    end
    
    def self.all
        @@all
    end

    def bakery
        dessert.bakery
    end

    def self.find_all_by_name(ingredient)
        all.select{|item| item.name.include?(ingredient)}
    end

end