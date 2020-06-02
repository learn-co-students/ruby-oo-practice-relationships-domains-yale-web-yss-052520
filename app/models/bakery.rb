# Bakery has many desserts
class Bakery
    attr_accessor :name 
    @@all = []

    def initialize(name)
        @name = name 
        self.class.all << self 
    end 

    def self.all 
        @@all 
    end 

    # An array of desserts the bakery makes
    def desserts 
        Dessert.all.select {|dessert| dessert.bakery == self}
    end 

    # An array of ingredients for the bakery's desserts
    # Dessert doesn't have an ingredients attribtute. THis is a sort of nesting of one to many relationships
    def ingredients
        desserts.map {|dessert| dessert.ingredients}.flatten
        
        #you should use the ingredients method in dessert
        # Ingredient.all.select {|ingredient| self.desserts.include?(ingredient.dessert)}
    end

    # Average number of calories for desserts sold at this bakery
    def average_calories

        # A bakery has many desserts - use methods in Dessert class!
        desserts.inject(0) {|sum, dessert| sum + dessert.calories} / desserts.size.to_f

        #total_calories = ingredients.inject(0) {|sum, ingredient| sum + ingredient.calorie_count}
        #total_calories.to_f / ingredients.size
    end 

    def shopping_list 
        ingredients.map {|ingredient| ingredient.name}
    end 
end 


# Dessert belongs to a bakery
# Dessert has many ingredients
class Dessert
    attr_accessor :bakery, :name 
    @@all = []

    def initialize(name, bakery)
        @name = name 
        @bakery = bakery
        self.class.all << self 
    end 

    def self.all 
        @@all 
    end 

    def ingredients 
        Ingredient.all.select {|ingredient| ingredient.dessert == self}
    end 

    def calories 
        self.ingredients.inject(0) {|sum, ingredient| sum + ingredient.calorie_count}
    end 
end 

# Ingredient belongs to a dessert
class Ingredient 
    attr_accessor :name, :dessert, :calorie_count 
    @@all = []

    def initialize(name, dessert, calorie_count)
        @calorie_count = calorie_count
        @dessert = dessert
        @name = name 
        self.class.all << self 
    end

    def self.all 
        @@all 
    end 

    def bakery 
        self.dessert.bakery 
    end 

    def self.find_all_by_name(substring_ingredient)
        # we aren't looking for exact matches (ie. chocolate sprinkles, chocolate mousse work when chocolate passed as parameter)
        self.all.select {|ingredient| ingredient.name.include?(substring_ingredient)}
    end 
end 