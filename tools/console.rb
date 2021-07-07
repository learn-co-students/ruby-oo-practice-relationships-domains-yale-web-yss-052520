require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

# Airbnb tests
l1= Listing.new("NY")
l2= Listing.new("PGH")
l3= Listing.new("LA")

g1= Guest.new("Maura")
g2= Guest.new("Kelly")

t1= Trip.new(l1, g1)
t2= Trip.new(l2, g1)
t3= Trip.new(l3, g2)
t4= Trip.new(l3, g1)

# Bakery tests
b1= Bakery.new("Tasty")
b2= Bakery.new("Somewhat Tasty")

d1= Dessert.new("Cookie", b1)
d2= Dessert.new("Bread", b1)
d3= Dessert.new("Cookie", b2)
d4= Dessert.new("Muffin", b2)

i1= Ingredient.new("flour", 10, d1)
i2= Ingredient.new("flour", 10, d2)
i3= Ingredient.new("flour", 10, d3)
i4= Ingredient.new("flour", 10, d4)
i5= Ingredient.new("chocolate chip", 100, d1)
i6= Ingredient.new("yeast", 5, d2)
i7= Ingredient.new("honey", 50, d4)

# Lyft tests 
p1= Passenger.new("Maura")
p2= Passenger.new("Kelly")

d1= Driver.new("Ari")
d2= Driver.new("Miller")

r1= Ride.new(p1, d1, 100)
r2= Ride.new(p1, d2, 20)
r3= Ride.new(p2, d1, 30)

# IMDB tests
m1= Movie.new("Funny")
m2= Movie.new("Sad")

s1= Show.new("Funny")
s2= Show.new("RomCom")
s3= Show.new("Reality")

a1= Actor.new("actor1")
a2= Actor.new("actor2")

c1= Character.new(name: "Maura", actor: a1, movie: m1, show: s1)
c2= Character.new(name: "Kelly", actor: a2, movie: m1)
c3= Character.new(name: "Hannah", actor: a2, show: s1)
c4= Character.new(name: "Harrison", actor: a2, show: s2)
c5= Character.new(name:"Andrew", actor: a2, show: s3)
c6= Character.new(name:"Will", actor: a1, movie: m2)

# Crowdfunding tests

Pry.start
