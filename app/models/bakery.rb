class Bakery
    attr_accessor :name
    @@all = []
    def initialize(name)
        @name=name
        @@all << self
    end
    def desserts
        Dessert.all.select{|dessert| dessert.bakery==self}
    end
    def ingredients
        desserts.map{|dessert| dessert.ingredients}.flatten
    end
    def average_calories #is this violating single purpose principle?
        total=desserts.reduce(0){|total, dessert| total+=dessert.calories}
        total/desserts.length
    end
    def shopping_list
        ingredients.map{|ingredient| ingredient.name}
    end
    def self.all
        @@all
    end
end

class Dessert
    attr_accessor :name, :bakery
    @@all = []
    def initialize(name, bakery)
        @name=name
        @bakery=bakery
        @@all << self
    end
    def ingredients
        Ingredient.all.select{|ingredient| ingredient.dessert==self}
    end
    def calories
        ingredients.reduce(0){|total, ingredient| total+=ingredient.calories}
    end
    def self.all
        @@all
    end
end

class Ingredient
    attr_accessor :name, :dessert, :calories
    @@all = []
    def initialize(name, calories, dessert)
        @name=name
        @calories=calories
        @dessert=dessert
        @@all << self
    end
    def bakery
        dessert.bakery
    end
    def self.all
        @@all
    end
    def self.find_all_by_name(ingredient_name) ## contains string, not exact match
        @@all.select{|ingredient| ingredient.name.include?(ingredient_name)}
    end
end