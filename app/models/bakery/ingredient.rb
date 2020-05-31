class Ingredient
    attr_accessor :dessert, :calorie_count

    @@all = []

    def initialize(dessert, calorie_count)
        @dessert = dessert
        @calorie_count = calorie_count
        save
    end

    def save
        self.class.all << self
    end

    def self.all
        @@all
    end
end