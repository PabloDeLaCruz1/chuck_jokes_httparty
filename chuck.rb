require "httparty"
require "pry"
require "colorize"

class ChuckJokes
  def help
    puts "READ THE DIRECTIONS AGAIN!".colorize(:blue)
  end

  def get_joke_by_id(id)
    res = HTTParty.get("https://api.icndb.com/jokes/#{id}")
    joke = res["value"]["joke"]

    if joke == nil
      return puts "NO JOKE HERE SON!".colorize(:red)
    end
    puts "#{id} - #{joke}"
  end

  def replace_name(first_name, last_name)
    res = HTTParty.get("http://api.icndb.com/jokes/random?firstName=#{first_name}&lastName=#{last_name}")
    id = res["value"]["id"]
    joke = res["value"]["joke"]
    puts "#{id} - #{joke}"
  end

  def random
    #This api allows you to pass /random for a random joke, using a random id number
    #would work, but the api is missing ids
    res = HTTParty.get("https://api.icndb.com/jokes/random")
    id = res["value"]["id"]
    joke = res["value"]["joke"]
    puts "#{id} - #{joke}"
  end
end
