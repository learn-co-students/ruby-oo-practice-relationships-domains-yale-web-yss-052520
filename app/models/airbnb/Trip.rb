class Trip

    @@all = []
    attr_accessor :guest , : listing
    
    def initialize(guest, listing)
        @guest = guest
        @listing = listing
        @@all << self
    end

    def self.all
        @@all
    end

end

# - #listing
#   - returns the listing object for the trip
# - #guest
#   - returns the guest object for the trip
# - .all
#   - returns an array of all trips
