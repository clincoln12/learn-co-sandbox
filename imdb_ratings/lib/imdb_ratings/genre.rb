class ImdbRatings::Genre
  attr_accessor :name
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def self.all
    ImdbRatings::Scraper.scrape_genres if @@all.empty?
    @@all
  end
end