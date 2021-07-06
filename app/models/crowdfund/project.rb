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

    def pledges
        Pledge.all.select {|pledge| pledge.project == self}
    end

    # determines whether or not any pledges have been made to project
    def pledge?
        if Pledge.all.find {|pledge| pledge.project == self}
            return true
        else
            return false
        end
    end

    def current_amount
        self.pledges.sum {|pledge| pledge.amount}
    end

    def backers
        self.pledges.map {|pledge| pledge.user}.uniq
    end

    def self.all
        @@all
    end

    def self.no_pledges
        self.all.select {|project| !project.pledge?}
    end

    def self.above_goal
        self.all.select {|project| project.current_amount >= project.pledge_goal}
    end

    def self.most_backers
        self.all.max {|a,b| a.backers.count <=> b.backers.count}
    end
end