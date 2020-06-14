require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

# Airbnb tests
# l1 = Listing.new("DC")
# l2 = Listing.new("CT")

# g1 = Guest.new("joe")
# g2 = Guest.new("sbrad")

# t1 = Trip.new(l1, g1)
# t2 = Trip.new(l2, g2)
# t2 = Trip.new(l1, g2)

# Bakery tests
  # b1 = Bakery.new()
  # b2 = Bakery.new()

  # ing_1 = Ingredients.new("Cinnamon", 200)
  # ing_2 = Ingredients.new("Apple", 10)
  # ing_3 = Ingredients.new("Salt", 88)
  # ing_4 = Ingredients.new("Pepper", 6)

  # d1 = Desserts.new(b1, [ing_1,ing_2])
  # d2 = Desserts.new(b2, [ing_3,ing_4])

  # Lyft tests
  p1 = Passenger.new()
  p2 = Passenger.new()

  d1 = Driver.new()
  d2 = Driver.new()

  r1 = Ride.new(100.0, p1, d1)
  r2 = Ride.new(40.0, p1, d2)
  r3 = Ride.new(99.0, p2, d1)
  r4 = Ride.new(2222.0, p2, d2)

Pry.start
