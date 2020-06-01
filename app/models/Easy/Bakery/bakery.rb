class Bakery

    @@all = []
    def initialize
        @@all << self
    end

    def desserts()
        Dessert.all().select{|dessert| dessert.bakery() == self}
    end

    def ingredients()
        desserts.map{|dessert| dessert.ingredients}.flatten()
    end

    def average_calories()
        total_cal = ingredients().reduce(0){|total, ing| total + ing.calorie}
        total_cal.to_f/desserts().count()
    end

    def shopping_list()
        ingredients().map{|ingredient| ingredient.name}.join(", ")
    end

    def self.all()
        @@all 
    end
end

