require "httparty"
require_relative "chuck.rb"
require "pry"

chuckInstance = ChuckJokes.new

#TODO account for edge cases
if ARGV[0] == "random"
  chuckInstance.random
elsif ARGV[0].to_i > 0
  chuckInstance.get_joke_by_id(ARGV[0].to_i)
elsif ARGV[0] && ARGV[1]
  chuckInstance.replace_name(ARGV[0], ARGV[1])
else
  chuckInstance.help
end
