class Project
    attr_reader :creator, :name, :goal

    @@all = []
    def initialize(creator, name, goal)
        @creator = creator
        @name = name
        @goal = goal
        @@all << self        
    end

    def pledges()
        Pledge.all().select{|pledge| pledge.project == self}
    end

    def backers()
        pledges().map{|pledge| pledge.user}
    end

    def current_amount()
        pledges().reduce(0){|total, pledge| total + pledge.amount}
    end

    def self.projects_created(user)
        all.select{|project| project.creator == user}
    end

    def self.creators()
        all.map {|project| project.creator}
    end
    
    def self.no_pledges()
        all().select{|project| project.pledges().empty?}
    end

    def self.above_goal()
        all().select{|project| project.current_amount() > project.goal}
    end

    def self.most_backers()
        all().max_by{|project| project.backers().uniq.count()}
    end

    def self.all()
        @@all 
    end
end