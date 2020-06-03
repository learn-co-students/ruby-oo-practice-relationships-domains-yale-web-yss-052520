# create files for your ruby classes in this directory
class Listing 

    @@all = []
    attr_accessor :city

    def initialize(city)
        @city = city
        @@all << self
    end 

    def self.all 
        @@all 
    end 

    def trips 
        Trip.all.select{|trip| trip.listing == self}
    end 

    def guests 
        trips.map{|listing| listing.guest}
    end 

    def trip_count 
        trips.count 
    end
    
    def self.find_all_by_city(city)
        @@all.select{|listing| listing.city == city}
    end 

    def self.most_popular 
        @@all.max_by{|listing| listing.trip_count}
    end 
end 



class Guest

    @@all = []
    attr_reader :name

    def initialize(name)
        @name = name 
        @@all << self 
    end 

    def self.all 
        @@all 
    end 

    def trips 
        Trip.all.select{|trip| trip.guest == self}
    end 

    def listings 
        trips.map{|trip| trip.listing}
    end 

    def trip_count 
        trips.count 
    end 

    def self.pro_traveller 
        @@all.select{|guest| guest.trip_count > 1}
    end 

    def find_all_by_name(name)
        @@all.select{|guest| guest.name == name}
    end 
end 



class Trip 

    @@all = []
    attr_accessor :listing, :guest

    def initialize(listing, guest)
        @listing = listing 
        @guest = guest 

        @@all << self 
    end 

    def self.all 
        @@all 
    end 
end 

class Bakery
    attr_reader :name
    @@all = []
  
    def initialize(name)
      @name = name
      @@all << self
    end

    def self.all
        @@all
      end
  
    def ingredients
        Ingredient.all.select{|ingredient| ingredient.dessert.bakery == self}
    end
    
    def desserts
      Dessert.all.select{|dessert| dessert.bakery == self}
    end
  
    def average_calories
      total_bakery = ingredients.map{|ingredient| ingredient.calories}.inject(:+)
      total_all_bakeries = Ingredient.all.map{|ingredient| ingredient.calories}.inject(:+)
      return total_bakery/total_all_bakeries.to_f
    end
  
    def shopping_list
      ingredients.map{|ingredient| ingredient.name}
    end
  
  end


  class Dessert
    attr_reader :name, :bakery
    @@all = []
  
    def initialize(name, bakery)
      @name = name
      @bakery = bakery
      @@all << self
    end

    def self.all
        @@all
      end
  
    def ingredients
      Ingredient.all.select{|ingredient| ingredient.dessert == self}
    end
  
  
    def calories
      total_dessert = 0
      ingredients.each do |ingredient|
        total_dessert += ingredient.calories
      end
      total_dessert
    end
  end



  class Ingredient
    attr_reader :name, :dessert, :bakery, :calories
    @@all = []
  
    def initialize(name, calories, dessert)
      @name = name
      @dessert = dessert
      @bakery = bakery
      @calories = calories
      self.class.all << self
    end

    def self.all
        @@all
    end
  
    def self.find_all_by_name(ingredient)
       all.any? {|element| element.include?(ingredient)}
    end
  
  end


class Passenger 
    attr_reader :name 
    @@all = []

    def initialize(name)
        @name = name 
        @@all << self 
    end 

    def self.all 
        @@all 
    end 

    def rides 
        Ride.all.select{|ride| ride.passenger == self}
    end

    def drivers 
        rides.map{|ride| ride.driver}
    end 

    def total_distance
        rides.collect{|ride| ride.distance}.sum
    end 

    def self.premium_members
        all.select{|passanger| passenger.total_distance > 100}
    end
end 

class Driver 
    attr_reader :name 
    @@all = []

    def initialize(name)
        @name = name 
        @@all << self 
    end 

    def self.all 
        @@all 
    end 

    def rides 
        Ride.all.select{|ride| ride.driver == self}
    end

    def passengers
        rides.map{|ride| ride.passenger}
    end 

    def total_distance
        rides.collect{|ride| ride.distance}.sum
    end 

    def self.mileage_cap(distance) 
        all.select{|driver| driver.total_distance > distance}
    end

end 

class Ride 
    attr_reader :passenger, :driver 
    attr_accessor :distance 
    @@all = []

    def initialize(distance, passenger, driver)
        @distance = distance 
        @passenger = passenger
        @driver = driver
        @@all << self 
    end 

    def self.all 
        @@all 
    end 

    def self.average_distance 
        all.sum / all.size
    end
end    