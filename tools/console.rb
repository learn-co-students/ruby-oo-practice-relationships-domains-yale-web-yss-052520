require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

#

def airbnb_tests
  l1 = Listing.new("Cool Place", "Texas")
  l2 = Listing.new("Good Place", "Maine")
  l3 = Listing.new("Bad Place", "Texas")

  g1 = Guest.new("Jim")
  g2 = Guest.new("Chad")
  g3 = Guest.new("Jeff")

  t1 = Trip.new("3/4", l1, g1)
  t2 = Trip.new("3/5", l1, g3)
  t3 = Trip.new("3/6", l2, g1)
  t4 = Trip.new("3/7", l3, g3)
  t5 = Trip.new("3/8", l3, g2)
end

def bakery_tests
  b1 = Bakery.new("Cool Bakery")
  b2 = Bakery.new("Neat Bakery")

  d1 = Dessert.new("Choco Cake", b1)
  d2 = Dessert.new("Vanilla Cake", b1)
  d3 = Dessert.new("Special Thing", b1)
  d4 = Dessert.new("Worm Food", b2)

  i1 = Ingredient.new("Flour", 100, d1)
  i2 = Ingredient.new("Paste", 25, d1)
  i3 = Ingredient.new("Milk", 300, d1)
  i4 = Ingredient.new("Prune Juice", 150, d2)
  i5 = Ingredient.new("Frosting", 50, d2)
  i6 = Ingredient.new("Salt", 100, d3)
  i7 = Ingredient.new("Candles", 500, d3)
  i8 = Ingredient.new("Melon", 125, d4)
  i9 = Ingredient.new("Ham", 75, d4)
end

def lyft_tests
  p1 = Passenger.new("Jeff")
  p2 = Passenger.new("Chad")
  p3 = Passenger.new("Jim")

  d1 = Driver.new("Bob")
  d2 = Driver.new("Rob")
  d3 = Driver.new("Job")

  r1 = Ride.new(p1, d1, 20)
  r2 = Ride.new(p1, d2, 10)
  r3 = Ride.new(p2, d1, 30)
  r4 = Ride.new(p3, d3, 5)
  r5 = Ride.new(p3, d3, 100)
  r6 = Ride.new(p2, d3, 50)
end

def imdb_tests
  movie = Movie.new("movie")
  show = Show.new("show")
  actor = Actor.new("chad")
  character = Character.new("superguy", actor)
  mjc = MovieJoinCharacter.new(movie, character)
  sjc = ShowJoinCharacter.new(show, character)
end

#

Pry.start
