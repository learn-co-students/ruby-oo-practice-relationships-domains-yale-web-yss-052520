class Project
    attr_accessor :pledge_goal, :creator

    @@all = []

    def initialize(creator, pledge_goal)
        @creator = creator
        @pledge_goal = pledge_goal
        save
    end

    def save
        self.class.all << self
    end

    def self.all
        @@all
    end
end