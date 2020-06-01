class Character
    attr_accessor :name, :actor
    @@all = []

    def initialize(args)
        args.each {|key, val| self.send(("#{key}="), val)}
        @@all << self
    end

    def self.unique_character_names()
        all().select{|charac| charac.name}.uniq
    end

    def self.most_appearances()
        all().max_by{|character| Plays.find_by_character(character).count()}
        #unique_character_names().max_by{|name| Plays.find_by_name(name)}
    end

    def self.all()
        @@all
    end
end


