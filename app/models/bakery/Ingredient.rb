class Ingredient
    attr_accessor :name, :calories, :dessert

    @@all = []

    def initialize(name, calories, dessert)
        @name = name
        @calories = calories
        @dessert = dessert

        @@all << self
    end

    def bakery
        dessert.bakery
    end

    def self.all
        @@all
    end

    def self.find_all_by_name(subIngredient)
        self.all.select{|ingredient| ingredient.name.include?(subIngredient)}
    end
end