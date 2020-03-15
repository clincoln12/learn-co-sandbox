class ImdbRatings::CLI
  def call
    puts "\nWelcome to IMDB Ratings\n"
    get_genres
    list_genres
    get_user_genre
  end
  
  def get_genres
    # get_genres: eventually scrape ONLY the movie genres off of IMDB
    @genres = ImdbRatings::Genre.all
  end
  
  def list_genres
    # list_genres: list the scraped genres in the form of a string
    @genres.each.with_index(1) do |genre, index|
      puts "#{index}. #{genre.name.strip}"
    end
    puts "Please select one of the genres above: "
  end
  
  def get_user_genre
    # get_user_genre: get and validate the users selected genre via numeric input
    chosen_genre = gets.strip.to_i
    show_movies(chosen_genre) if valid_input?(chosen_genre, @genres)
  end
  
  def valid_input?(input, data)
    # valid_input?: Does the user input fall between the range of listed genres?
    input.to_i <= data.length && input.to_i > 0
  end
  
  def show_movies(chosen_genre)
    genre = @genres[chosen_genre - 1]
    puts "Here are the current Top 50 #{genre.name.strip} movies on IMDB:"
    genre.movies
  end
  
end







