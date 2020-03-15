class ImdbRatings::Movie
  attr_accessor :name, :year, :rating
  @@all = []
  
  def initialize(name, year, rating)
    @name = name
    @year = year
    @rating = rating
    @@all << self unless @@all.include?(self)
  end
end