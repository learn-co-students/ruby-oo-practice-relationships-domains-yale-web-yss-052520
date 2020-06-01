class User
    attr_accessor :name
    @@all = []
    def initialize(name)
        @name=name
        @@all << self
    end
    def pledges
        Pledge.all.select{|pledge| pledge.user==self}
    end
    def backed_projects
        pledges.map{|pledge| pledge.project}.uniq
    end
    def created_projects
        Project.all.select{|project| project.creator==self}
    end
    def self.all
        @@all
    end
    def self.highest_pledge
        Pledge.all.max{|pledge1, pledge2| pledge1.amount <=> pledge2.amount}.user
    end
    def self.multi_pledger
        @@all.select{|user| user.pledges.length>1}
    end
    def self.project_creator
        @@all.select{|user| user.created_projects.length>=1}
    end
end

class Project
    attr_accessor :name, :creator, :goal
    @@all = []
    def initialize(name, creator, goal)
        @name=name
        @creator=creator
        @goal=goal
        @@all << self
    end
    def pledges
        Pledge.all.select{|pledge| pledge.project==self}
    end
    def backers
        pledges.map{|pledge| pledge.user}.uniq
    end
    def self.all
        @@all
    end
    def pledge_value
        pledges.reduce(0){|total, pledge| total+=pledge.amount}
    end
    def self.no_pledges
        @@all.select{|project| project.pledges.length==0}
    end
    def self.above_goal
        @@all.select{|project| project.pledge_value>=project.goal}
    end
    def self.most_backers
        @@all.max{|project1, project2| project1.backers.length <=> project2.backers.length}
    end
end

class Pledge
    attr_accessor :user, :project, :amount
    @@all = []
    def initialize(user, project, amount)
        @user=user
        @project=project
        @amount=amount
        @@all << self
    end
    def self.all
        @@all
    end
end