class ImdbRatings::Scraper
  def self.scrape_genres
    doc = Nokogiri::HTML(open("https://www.imdb.com/feature/genre/?ref_=nv_ch_gr"))
  end
end