require_relative "./client.rb"
require_relative "./location.rb"
require_relative "./trainer.rb"
require "bundler"

Bundler.require

buzz = Trainer.new("Buzz")
downtown = Location.new("Downtown")
uptown = Location.new("Uptown")
amy = Client.new("Amy")

amy.assign_trainer(buzz, downtown)

# binding.pry
0