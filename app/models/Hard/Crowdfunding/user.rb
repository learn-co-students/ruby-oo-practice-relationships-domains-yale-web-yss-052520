class User
    attr_reader :name
    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end

    def create_project(name, goal)
        Project.new(self, name, goal)
    end

    def back_project(project, amount)
        Pledge.new(self, amount, project)
    end

    def projects_created()
        Project.projects_created(self)
    end

    def pledges()
        Pledge.find_by_pledger(self)
    end

    def pledged_projects()
        pledges().map{|pledge| pledge.project}.uniq
    end

    def self.highest_pledge()
        all().select{|user| Pledge.max_pledge().user == user}
    end

    def self.multi_pledger()
        all().select{|user| user.pledged_projects().count() > 1}
    end

    def self.project_creator()
        creators = Project.creators()
        all.select{|user| creators.include?(user)}
    end

    def self.all()
        @@all
    end
end

# bob = User.new("bob")
# carol = User.new("carol")
# dave = User.new("dave")

# d_proj1 = dave.create_project("proj1", 25)
# d_proj2 = Project.new(dave, "proj2", 30)
# c_proj1 = carol.create_project("proj1", 100)

# pledge_1 = bob.back_project(d_proj1, 15)
# pledge_2 = Pledge.new(carol, 14, d_proj2)
# pledge_3 = bob.back_project(c_proj1, 99)


