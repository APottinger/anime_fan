require_relative "./anime_fan/version"
require_relative "../lib/concerns/findable"
require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative "./cli"
require_relative "./scraper"
require_relative "./shows"


module AnimeFan
  class Error < StandardError; end
  # Your code goes here...
end
