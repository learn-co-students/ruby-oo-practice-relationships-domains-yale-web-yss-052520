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
        Ingredient.all.select{|ingredient| ingredient.dessert == self}
    end 
    
    def calories
        ingredients.reduce(0) {|sum, ingredient| sum + ingredient.calories}
    end
end 