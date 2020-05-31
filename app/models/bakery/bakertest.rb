require_relative "./dessert.rb"
require_relative "./ingredient.rb"
require_relative "./bakery.rb"
require "bundler"

Bundler.require

sweet_tooth = Bakery.new
cupcake = Dessert.new(sweet_tooth)
cookie = Dessert.new(sweet_tooth)
sprinkles = Ingredient.new(cupcake, 100)
choc_chips = Ingredient.new(cookie, 25)

binding.pry
0