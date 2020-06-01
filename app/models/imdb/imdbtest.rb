require_relative "./character.rb"
require_relative "./movie.rb"
require_relative "./actor.rb"
require_relative "./show.rb"
require_relative "./casting.rb"
require "bundler"

Bundler.require

casey = Actor.new("Casey Abrams")
george = Actor.new("George Lopez")
goofy = Character.new("Goofy")
abe_lincoln = Character.new("Abraham Lincoln")
mildred = Character.new("Mildred")
mickey_show = Show.new("Mickey Mouse")
mickey_movie = Movie.new("Mickey Mouse")
lincoln = Movie.new("Lincoln")

casting1 = Casting.new(casey, goofy, mickey_show)
casting2 = Casting.new(casey, abe_lincoln, lincoln)
casting3 = Casting.new(george, mildred, lincoln)

binding.pry
0