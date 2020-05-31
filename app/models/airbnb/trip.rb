class Trip
    attr_accessor :listing, :guest

    @@all = []

    def initialize(listing, guest)
        @listing = listing
        @guest = guest
        save
    end

    def save
        self.class.all << self
    end

    def self.all
        @@all
    end
end