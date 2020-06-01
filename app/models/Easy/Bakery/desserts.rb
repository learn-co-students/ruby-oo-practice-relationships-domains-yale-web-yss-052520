class Dessert
    attr_reader :bakery
    
    @@all = []
    def initialize(bakery)
        @bakery = bakery
        @@all << self
    end

    def ingredients()
        Ingredient.all().select{|ingredient| ingredient.dessert == self}
    end

    def calories()
        ingredients.reduce(0) {|sum, ingredient| sum + ingredient.calorie}
    end 

    def self.all()
        @@all 
    end
end