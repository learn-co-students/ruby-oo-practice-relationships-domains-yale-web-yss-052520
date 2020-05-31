require_relative "./listing.rb"
require_relative "./guest.rb"
require_relative "./trip.rb"
require "bundler"

Bundler.require

guest1 = Guest.new("Stacy")
guest2 = Guest.new("Arnold")

listing1 = Listing.new("Denver, CO")
listing2 = Listing.new("Sacramento, CA")
listing3 = Listing.new("Denver, CO")

trip1 = Trip.new(listing1, guest1)
trip2 = Trip.new(listing2, guest2)
trip3 = Trip.new(listing1, guest2)

binding.pry
0