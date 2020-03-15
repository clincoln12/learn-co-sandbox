class ImdbRatings::Genre
  attr_accessor :name, :path
  attr_writer :movies
  @@all = []
  
  def initialize(name, path)
    @name = name
    @path = path
    @movies = []
    @@all << self unless @@all.include?(self.name)
  end
  
  def self.all
    ImdbRatings::Scraper.scrape_genres if @@all.empty?
    @@all
  end
  
  def movies
    ImdbRatings::Scraper.scrape_movies(self) if @movies.empty?
    @movies
  end
end