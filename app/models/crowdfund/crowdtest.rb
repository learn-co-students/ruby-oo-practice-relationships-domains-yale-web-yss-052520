require_relative "./pledge.rb"
require_relative "./project.rb"
require_relative "./user.rb"
require "bundler"

Bundler.require

darcy = User.new("Darcy")
david = User.new("David")
nicole = User.new("Nicole")

first_project = Project.new(david, 1000)
pr_2 = Project.new(darcy, 2000)
pr_3 = Project.new(darcy, 4000)

first_pledge = Pledge.new(darcy, first_project, 50)
pl_2 = Pledge.new(darcy, first_project, 500)
pl_3 = Pledge.new(david, pr_2, 35)
pl_4 = Pledge.new(david, pr_2, 5550)
pl_5 = Pledge.new(nicole, pr_2, 300)

# binding.pry
0