
class User
    #can create and back projects 
    @@all = [] 
    def initialize(name)
        @name = name 
        @@all << self 
    end 
    attr_reader :name 
    def self.all
        @@all 
    end 

    def projects_created 
        Project.all.select {|one_project| one_project.creator == self}
    end 

    def pledges_made
        Pledge.all.select {|one_pledge| one_pledge.user == self }
    end 

    def projects_backed 
        self.pledges_made.map {|one_pledge| one_pledge.project}.uniq 
    end 

    def num_projects_backed 
        self.projects_backed.size 
    end 

    def total_pledged 
        self.pledges_made.sum {|one_pledge| one_pledge.amount}
    end 

    def self.highest_pledge 
        @@all.max(1) {|one_user| one_user.total_pledged}
    end 

    def self.multi_pledger
        @@all.select {|one_user| one_user.num_projects_backed > 1}
    end 

    def self.project_creator 
        @@all.select {|one_user| one_user.projects_created}
    end 
end 

class Pledge 
    @@all = [] 
    def initialize(user, project, amount)
        @user = user 
        @project = project 
        @amount = amount 
        @@all << self 
    end 
    attr_reader :user, :project, :amount 
    def self.all 
        @@all 
    end 

end 

class Project 
    @@all = [] 
    def initialize(name,creator, goal)
        @name = name
        @creator = creator 
        @goal = goal 
        @@all << self 
    end  
    attr_reader :name, :creator, :goal 
    def self.all 
        @@all 
    end 

    def pledges 
        Pledge.all.select {|one_pledge| one_pledge.project == self}
    end 

    def num_pledges 
        if self.pledges.size 
            return self.pledges.size 
        else return 0 
        end 
    end 

    def self.no_pledges 
        @@all.select {|one_project| one_project.num_pledges == 0}
    end 

    def amount_pledged 
        self.pledges.sum {|one_pledge| one_pledge.amount} 
    end 

    def above_goal?
        if self.amount_pledged >= @goal 
            return true 
        else return false  
        end  
    end 

    def self.above_goal 
        @@all.select {|one_project| one_project.above_goal? }
    end 

    def backers 
        self.pledges.map {|one_pledge| one_pledge.user}.uniq 
    end 

    def num_backers 
        self.backers.size 
    end 

    def self.most_backers 
        @@all.max(1) {|one_project| one_project.num_backers}
    end 

end 

u1 = User.new("u1")
u2 = User.new("u2")

p1 = Project.new("p1", u1, 100)
p2 = Project.new("p2", u2, 100)
p3 = Project.new("p3", u1, 100)

pledge1 = Pledge.new(u1, p1, 100)
pledge2 = Pledge.new(u2, p1, 200)
pledge3 = Pledge.new(u2, p2, 100)

puts Project.most_backers

