require_relative "./one_love_adoptions/version"

module OneLoveAdoptions
  class Error < StandardError; end
  # Your code goes here...
end

require_relative './cli.rb'
require_relative './dog.rb'
require_relative './dog_scraper.rb'
require_relative './cat_scraper.rb'
require_relative './cat.rb'
require_relative './pet_scraper.rb'

require 'pry'
require 'nokogiri'
require 'open-uri'

