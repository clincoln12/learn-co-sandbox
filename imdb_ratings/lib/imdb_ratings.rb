require_relative "imdb_ratings/version"
require_relative "imdb_ratings/cli"
require_relative "imdb_ratings/genre"
require_relative "imdb_ratings/movie"
require_relative "imdb_ratings/scraper"

require 'pry'
require 'nokogiri'
require 'open-uri'
require 'colorize'

module ImdbRatings
  class Error < StandardError; end
  # Your code goes here...
end
