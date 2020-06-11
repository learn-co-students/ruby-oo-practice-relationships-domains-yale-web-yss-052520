class Bakery
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def ingredients
        desserts.map{|dessert| dessert.ingredients}.flatten
    end

    def desserts
        Dessert.all.select{|dessert| dessert.bakery == self}
    end

    def average_calories
        desserts.inject(0){|sum, dessert| sum + dessert.calories} / desserts.size.to_f
    end 

    def shopping_list
        ingredients.map{|ingredient| ingredient.name}
    end

end