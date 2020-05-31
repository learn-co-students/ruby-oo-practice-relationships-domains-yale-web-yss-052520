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
end