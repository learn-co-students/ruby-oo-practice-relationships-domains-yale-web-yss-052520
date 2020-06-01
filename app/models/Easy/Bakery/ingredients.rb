class Ingredient
    attr_accessor :dessert, :name, :calorie

    @@all = []
    def initialize(args)
        args.each{|key, val| self.send(("#{key}="), val)}
        @@all << self
    end

    def bakery()
        @dessert.bakery()
    end

    def self.find_all_by_name(name)
        all().select{|ingredient| ingredient.name.include?(name)}
    end

    def self.all()
        @@all
    end
end