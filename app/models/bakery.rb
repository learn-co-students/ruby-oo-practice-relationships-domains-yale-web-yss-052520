class Bakery
    @@all = []
    def initialize
        @@all << self
    end

    def desserts
        Desserts.all.select{|dessert| dessert.bakery == self}
    end

    def ingredients
        desserts.map(&:ingredients)
    end

    def average_calories
        ingredients.flatten.sum(&:cal_count)
    end

    def shopping_list
        ingredients.flatten.map(&:name)
    end

    def self.all
        @@all
    end
end

class Desserts
    
    attr_reader :bakery, :ingredients
    @@all = []

    def initialize(bakery, ingredients) # ingridient is an array
        @bakery = bakery
        @ingredients = ingredients
        @@all << self
    end

    def calories
        self.ingredients.sum(&:cal_count)
    end

    def self.all
        @@all
    end
end

class Ingredients
    attr_reader :cal_count, :name

    @@all = []
    def initialize(name, cal_count)
        @name = name
        # @dessert = dessert
        @cal_count = cal_count
        @@all << self
    end

    def bakery
        # self.dessert.bakery
        Desserts.all.find{|des| des.ingredients.include?(self)}
    end

    def find_all_by_name(ingredient)
        Ingredients.all.select{|ing| ing.name.include?(ingredient)}
    end

    def self.all
        @@all
    end
end