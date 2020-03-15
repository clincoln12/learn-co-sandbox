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
  
  def self.scrape_movies(path)
    genre_path = ImdbRatings::Genre.path
    doc = Nokogiri::HTML(open("https://www.imdb.com#{genre_path}"))
    movie_divs = doc.css("div.lister-item.mode-advanced")
  end
end