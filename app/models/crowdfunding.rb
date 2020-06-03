require 'pry'

# User supports many projects through pledges
class User
    attr_reader :name 
    @@all = []

    def initialize(name)
        @name = name 
        self.class.all << self 
    end

    def self.all 
        @@all 
    end 

    def pledges 
        Pledge.all.select {|pledge| pledge.user == self }
    end 

    # Returns the highest pledge for this instance of user
    # Need to account for the fact that some users might not have pledges
    def user_highest_pledge
        self.pledges.empty? ? 0 : self.pledges.map {|pledge| pledge.amount}.max 
    end 

    def self.highest_pledge
        self.all.max_by {|user| user.user_highest_pledge}
    end 

    def self.multi_pledger
        self.all.select {|user| user.pledges.size > 1}
    end     


    def self.project_creator
        Project.all.map {|project| project.creator}.uniq
    end     
end 

# Pledge belongs to a user. A user has many pledges
# Pledge belongs to a project. A project has many pledges.
class Pledge 
    attr_reader :user, :amount, :project 
    @@all = []

    def initialize(user, amount, project)
        @user = user 
        @amount = amount 
        @project = project
        self.class.all << self 
    end 

    def self.all 
        @@all 
    end 
end 

class Project
    attr_reader :creator, :name, :goal 
    @@all = []
    
    def initialize(creator, name, goal)
        @creator = creator 
        @goal = goal 
        @name = name 
        self.class.all << self 
    end 

    def self.all 
        @@all 
    end 

    def pledges
        Pledge.all.select {|pledge| pledge.project == self }
    end

    # Returns all users backing the project 
    def backers 
        self.pledges.map {|pledge| pledge.user}.uniq
    end 

    def self.no_pledges 
        self.all.select {|project| project.pledges.size == 0}
    end 

    # Returns amount of money raised by a single project
    def amount_raised 
        self.pledges.inject(0) {|sum, pledge| sum + pledge.amount}
    end 

    def self.above_goal 
        self.all.select {|project| project.amount_raised >= project.goal}
    end 

    def self.most_backers
        self.all.max_by {|project| project.backers.size}
    end
end 