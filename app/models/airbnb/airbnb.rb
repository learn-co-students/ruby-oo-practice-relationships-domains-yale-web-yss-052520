guest1 = Guest.new("Stacy")
guest2 = Guest.new("Arnold")

listing1 = Listing.new("Denver, CO")
listing2 = Listing.new("Sacramento, CA")

trip1 = Trip.new(listing1, guest1)
trip2 = Trip.new(listing2, guest2)