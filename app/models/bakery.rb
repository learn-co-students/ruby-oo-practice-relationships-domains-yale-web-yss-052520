class Bakery
    @@all = [] 
    def initialize(name)
        @name = name 
        @@all << self 
    end 
    attr_reader :name 
    def self.all 
        @@all 
    end 

    def desserts 
        Dessert.all.select {|one_dessert| one_dessert.bakery == self}
    end 

    def ingredients 
        self.desserts.map {|one_dessert| one_dessert.ingredients}.flatten 
    end 

    def dessert_count
        self.desserts.size 
    end 

    def average_calories 
        total_calories = self.desserts.sum {|one_dessert| one_dessert.calories}
        total_calories / self.dessert_count 
    end 

    def shopping_list 
        self.ingredients.map do |one_ingredient| 
            one_ingredient.name 
        end.join(", ")
    end 
end 

class Dessert 
    @@all = [] 
    def initialize(name,bakery)
        @name = name 
        @bakery = bakery 
        @@all << self 
    end 
    attr_reader :name, :bakery 
    def self.all 
        @@all 
    end 

    def ingredients 
        Ingredient.all.select {|one_ingredient| one_ingredient.dessert == self}
    end 

    def calories 
        self.ingredients.sum {|one_ingredient| one_ingredient.calories}
    end 
end 

class Ingredient 
    @@all = [] 
    def initialize(name, dessert, calories)
        @name = name 
        @dessert = dessert 
        @calories = calories.to_f
        @@all << self 
    end 
    attr_reader :name, :dessert, :calories 
    def self.all
        @@all
    end 

    def bakery 
        self.dessert.bakery 
    end 

    def self.find_all_by_name(name_in)
        @@all.select do|one_ingredient| 
            self.helper_includes?(one_ingredient.name.split(" "), ("chocolate")) 
        end 
    end 

    def self.helper_includes?(arr,strg)
        if arr.find(strg) 
            return true 
        end 
        return false 
    end 
end 

#tests for ingredients 
# puts Ingredient.find_all_by_name("ind1")

bak1 = Bakery.new("bak1")

dess1 = Dessert.new("dess1",bak1)
ind1 = Ingredient.new("ind1",dess1, 30)
ind2 = Ingredient.new("ind2", dess1, 20)

dess2 = Dessert.new("dess2",bak1)
ind3 = Ingredient.new("ind3",dess2, 2)
ind4 = Ingredient.new("ind4", dess2, 3)


puts bak1.shopping_list