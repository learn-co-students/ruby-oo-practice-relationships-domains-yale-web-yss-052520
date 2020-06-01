class Pledge
    attr_reader :user, :amount, :project
    @@all = []

    def initialize(user, amount, project)
        @user = user
        @amount = amount
        @project = project

        @@all << self
    end

    def self.max_pledge()
        all().max_by{|pledge| pledge.amount}
    end

    def self.find_by_pledger(pledger)
        all().select{|pledge| pledge.user == pledger}
    end

    def self.all()
        @@all 
    end
end