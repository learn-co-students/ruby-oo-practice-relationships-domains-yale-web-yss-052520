class Pledge
    attr_accessor :user, :project, :amount

    @@all = []

    def initialize(user, project, amount)
        @user = user
        @project = project
        @amount = amount
        save
    end

    def save
        self.class.all << self
    end

    def self.all
        @@all
    end
end