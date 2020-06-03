# Level: Easy
# All classes are in this file for simplicity

class Bakery
    # has many desserts
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name=name
        self.class.all << self
    end

    def self.all
        @@all
    end

    def desserts
        Dessert.all.select {|dessert| dessert.bakery == self}
    end

    def ingredients
        # flattened so I could access the ingredient's name attribute in #shopping_list
        desserts.map(&:ingredients).flatten
    end

    def average_calories
        # total calories / num desserts
        desserts.sum {|dessert| dessert.calories} / desserts.count
    end

    def shopping_list
        # I want to use .uniq on this then how do I show quantity other than explicitly?
        ingredients.map {|ingredient| ingredient.name}
    end
end

class Dessert
    # has many ingredients && belongs to a bakery
    attr_accessor :bakery, :name
    @@all = []

    def initialize(name, bakery)
        @name=name
        @bakery=bakery
        self.class.all << self
    end

    def self.all
        @@all
    end

    def ingredients
        Ingredient.all.select {|ingredient| ingredient.dessert == self}
    end

    def calories
        ingredients.sum {|ingredient| ingredient.calories}
    end
end

class Ingredient
    # belongs to dessert
    attr_accessor :name, :dessert, :calories
    @@all = []

    def initialize (name, calories, dessert)
        @name=name
        @calories=calories
        @dessert=dessert
        self.class.all << self
    end

    def self.all
        @@all
    end

    def self.find_all_by_name(ingredient_name)
        self.all.select {|ingredient| ingredient.name.include?(ingredient_name)}
    end
end