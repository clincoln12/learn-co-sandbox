class ImdbRatings::Movie
  attr_accessor :name, :year, :rating
  @@all = []
  
  def initialize(name)
    @name = name
    @movies = []
    @@all << self unless @@all.include?(self.name)
  end
  
  def self.all
    ImdbRatings::Scraper.scrape_movies if @@all.empty?
    @@all
  end
  
  def movies
    ImdbRatings::Scraper.scrape_movies if @movies.empty?
    @movies
  end
end