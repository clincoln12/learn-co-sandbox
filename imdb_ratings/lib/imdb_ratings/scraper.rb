class ImdbRatings::Scraper
  def self.scrape_genres
    doc = Nokogiri::HTML(open("https://www.imdb.com/feature/genre/?ref_=nv_ch_gr"))
    
    article_divs = doc.css("div.article")
    
    popular_movies_div = article_divs.select do |d|
      d.text.include?('Popular Movies by Genre')
    end
    
    genre_links = popular_movies_div.first.css("a")
    
    genre_links.each do |thing|
      name = thing.text.strip
      path = thing.attributes['href'].value
      ImdbRatings::Genre.new(name, path)
    end
  end
  
  def self.scrape_movies(genre)
    imdb_url = "https://www.imdb.com#{genre.path}"
    doc = Nokogiri::HTML(open(imdb_url))
    movie_divs = doc.css("div.lister-item.mode-advanced")
    
    scraped_movies = movie_divs.map do |movie_div|
      header = movie_div.css('h3').first # this includes the name and the year
      
      title = header.css('a').text
      year = header.css('span.lister-item-year').text
      rating = movie_div.css('div.ratings-imdb-rating').text.strip
      
      ImdbRatings::Movie.new(title, year, rating)
    end
    genre.movies = scraped_movies
  end
end