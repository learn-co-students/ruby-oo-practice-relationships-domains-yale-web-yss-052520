class Ingredient
    attr_accessor :dessert, :calorie_count, :name

    @@all = []

    def initialize(dessert, calorie_count, name)
        @dessert = dessert
        @calorie_count = calorie_count
        @name = name
        save
    end

    def save
        self.class.all << self
    end

    def self.all
        @@all
    end

    def self.find_all_by_name(ing_name)
        self.all.select {|ing| ing.name.include? ing_name} 
    end
end