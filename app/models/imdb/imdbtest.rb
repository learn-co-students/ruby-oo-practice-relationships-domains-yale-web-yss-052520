require_relative "./character.rb"
require_relative "./actor.rb"
require_relative "./movie.rb"
require_relative "./show.rb"
require "bundler"

Bundler.require

casey = Actor.new("Casey Abrams")
goofy = Character.new("Goofy", casey)
mickey_show = Show.new("Mickey Mouse")
mickey_movie = Movie.new("Mickey Mouse")

binding.pry
0