# create files for your ruby classes in this directory
def User
    attr_accessor :name

    @@all = all

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def pledges
        Pledge.all.select{|pledge| pledge.user == self}
    end

    def self.highest_pledge
        Pledge.all.max_by{|pledge| pledge.amount}.user
    end

    def self.multi_pledger
        self.all.select{|user| user.pledges.length > 1}
    end

    def self.project_creator
        Project.all.map{|project| project.creator}.uniq
    end
end

def Project
    attr_accessor :name, :creator, :goal

    @all = []

    def initialize(name, creator, goal)
        @name = name
        @creator = creator
        @goal = goal
        @@all << self
    end

    def self.all
        @@all
    end

    def pledges
        Pledge.all.select{|pledge| pledge.project == self}
    end

    def backers
        self.pledges.map{|pledge| pledge.user}.uniq
    end

    def total_funds
        self.pledges.map{|pledge| pledge.amount}.sum
    end

    def self.no_pledges
        self.all.select{|project| project.pledges.empty?}
    end

    def self.above_goal
        self.all.select{|project| project.total_funds > project.goal}
    end

    def self.most_backers
        self.all.max_by{|project| project.backers.length}
    end

def Pledge
    attr_accessor :project, :user, :amount

    @@all = []

    def initialize(project, user, amount)
        @project = project
        @user = user
        @amount = amount

        @@all << self
    end

    def self.all
        @@all
    end

end