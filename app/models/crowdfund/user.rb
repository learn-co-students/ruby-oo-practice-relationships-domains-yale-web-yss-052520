class User
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        save
    end

    def save
        self.class.all << self
    end

    def pledges
        Pledge.all.select {|pledge| pledge.user == self}
    end

    def highest_pledge
        pledges.max {|a,b| a.amount <=> b.amount}
    end

    def self.all
        @@all
    end

    # returns array of all users who have made pledges
    def self.pledged
        self.all.select {|user| !user.pledges.empty?}
    end

    # finds user who has made the highest pledge
    def self.highest_pledge
        self.pledged.max {|a,b| a.highest_pledge.amount <=> b.highest_pledge.amount}
    end

    def self.multi_pledger
        self.pledged.select {|user| user.pledges.count > 1}
    end

    def self.project_creator
        Project.all.map {|project| project.creator}.uniq
    end
end