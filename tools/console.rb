require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

# Instantiations for testing of airbnb
l1 = Listing.new("NYC")
l2 = Listing.new("Chicago")
l3 = Listing.new("Boston")
l4 = Listing.new("Seattle")
l5 = Listing.new("Salt Lake City")
l6 = Listing.new("Hilton Head")
l7 = Listing.new("Los Angeles")

g1 = Guest.new("Bob")
g2 = Guest.new("Bill")
g3 = Guest.new("Babe")
g4 = Guest.new("Bimbo")
g5 = Guest.new("Bailey")
g6 = Guest.new("Jane")
g7 = Guest.new("Joe")

t1 = Trip.new(g1, l1)
t2 = Trip.new(g2, l7)
t3 = Trip.new(g4, l6)
t4 = Trip.new(g5, l5)
t5 = Trip.new(g7, l4)
t6 = Trip.new(g1, l3)
t7 = Trip.new(g3, l2)
t8 = Trip.new(g6, l3)

# Testing for Bakery
b1 = Bakery.new("b1")
b2 = Bakery.new("b2")
b3 = Bakery.new("b3")
b4 = Bakery.new("b4")
b5 = Bakery.new("b5")

d1 = Dessert.new("muffin", b1)
d2 = Dessert.new("cake", b2)
d3 = Dessert.new("scone", b3)
d4 = Dessert.new("muffin", b5)
d5 = Dessert.new("cookie", b2)
d6 = Dessert.new("tart", b1)
d7 = Dessert.new("pie", b4)

i1 = Ingredient.new("flour", d1, 100)
i2 = Ingredient.new("flour", d2, 100)
i3 = Ingredient.new("flour", d3, 100)
i4 = Ingredient.new("flour", d4, 100)
i5 = Ingredient.new("chocolate", d5, 100)
i6 = Ingredient.new("flour", d7, 100)

# Testing for Lyft
p1 = Passenger.new("Bob")
p2 = Passenger.new("Bill")
p3 = Passenger.new("Brian")
p4 = Passenger.new("Brett")
p5 = Passenger.new("Kyle")
p6 = Passenger.new("Drew")

dr1 = Driver.new("Alex")
dr2 = Driver.new("Abby")
dr3 = Driver.new("Sarah")
dr4 = Driver.new("Jeff")
dr5 = Driver.new("Janice")
dr6 = Driver.new("Ryan")

r1 = Ride.new(p1, dr5, 50)
r2 = Ride.new(p2, dr5, 51)
r3 = Ride.new(p4, dr1, 55)
r4 = Ride.new(p6, dr2, 56)
r5 = Ride.new(p5, dr6, 57)
r6 = Ride.new(p2, dr3, 58)
r7 = Ride.new(p1, dr4, 59)
r8 = Ride.new(p3, dr1, 52)
r9 = Ride.new(p3, dr2, 53)


# Tests for IMDB
m1 = Movie.new("Spiderman 1")
m2 = Movie.new("Spiderman 2")
m3 = Movie.new("Spiderman 3")
m4 = Movie.new("Spiderman 4")
m5 = Movie.new("Batman 1")
m6 = Movie.new("Batman 2")
m7 = Movie.new("Batman 3")

s1 = Show.new("The Office")
s2 = Show.new("Game of Thrones")
s3 = Show.new("Fauda")
s4 = Show.new("All American")
s5 = Show.new("Quantico")
s6 = Show.new("Breaking Bad")
s7 = Show.new("Little Fires Everywhere")

a1 = Actor.new("Chris Evans")
a2 = Actor.new("Michelle Dockery")
a3 = Actor.new("Tom Holland")
a4 = Actor.new("Milo Ventamiglia")
a5 = Actor.new("Tom Hanks")
a6 = Actor.new("Kevin Hart")

c1 = Character.new(a1, "Captain America")
c2 = Character.new(a2, "Mom")
c3 = Character.new(a3, "Spiderman")
c4 = Character.new(a4, "Dad")
c5 = Character.new(a5, "Forest Gump")
c6 = Character.new(a6, "Comedy")

r1 = Role.new(c1, m1)
r2 = Role.new(c1, m2)
r3 = Role.new(c1, m3)
r4 = Role.new(c2, s1)
r5 = Role.new(c2, s6)
r6 = Role.new(c3, m4)
r7 = Role.new(c4, s1)
r8 = Role.new(c5, s7)
r9 = Role.new(c6, s7)
r10 = Role.new(c6, s6)
r11 = Role.new(c4, s4)

# Tests for Crowdfunding
u1 = User.new("Bob")
u2 = User.new("Bill")
u3 = User.new("Brian")
u4 = User.new("Briana")
u5 = User.new("Bailey")
u6 = User.new("Babe")
u7 = User.new("Barack")
u8 = User.new("Billy")
u9 = User.new("Bobby")

pr1 = Project.new(u1, "Airbnb", 2000000)
pr2 = Project.new(u2, "Facebook", 205650000)
pr3 = Project.new(u3, "Twitter", 153298)
pr4 = Project.new(u4, "KikiAir", 1234)
pr5 = Project.new(u5, "Apple", 1346457345134)
pr6 = Project.new(u6, "Microsoft", 356666666)
pr7 = Project.new(u7, "Allbirds", 3241)
pr8 = Project.new(u1, "Everlane", 63463452)
pr9 = Project.new(u3, "Patagonia", 345636)
pr10 = Project.new(u6, "Earth Fund", 2000333000)

pl1 = Pledge.new(u2, 350239, pr1)
pl2 = Pledge.new(u2, 3, pr1)
pl3 = Pledge.new(u2, 423431, pr3)
pl4 = Pledge.new(u3, 2, pr2)
pl5 = Pledge.new(u1, 3503124239, pr3)
pl6 = Pledge.new(u1, 52315, pr4)
pl7 = Pledge.new(u4, 3324, pr5)
pl8 = Pledge.new(u5, 23, pr6)
pl9 = Pledge.new(u7, 123, pr7)
pl10 = Pledge.new(u9, 1253, pr8)
pl11 = Pledge.new(u9, 234, pr9)
pl12 = Pledge.new(u6, 12, pr10)
pl13 = Pledge.new(u5, 1243251346134, pr2)
pl14 = Pledge.new(u1, 12412412, pr2)















Pry.start
