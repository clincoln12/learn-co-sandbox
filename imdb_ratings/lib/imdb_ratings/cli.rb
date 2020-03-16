class ImdbRatings::CLI
  def call
    puts "\nWelcome to IMDB Ratings\n".yellow.bold
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
      puts "#{index}. #{genre.name.strip.yellow}"
    end
    puts "^ Select one of the genres above (Select the number you want) ^".yellow.bold
  end
  
  def get_user_genre
    # get_user_genre: get and validate the users selected genre via numeric input
    chosen_genre = gets.strip.to_i
    if valid_input?(chosen_genre, @genres)
      show_movies(chosen_genre)
    else
      puts "\nInvalid. Please pick a number associated with a genre.\n".yellow.bold
      sleep 3
      call
    end
  end
  
  def get_user_decision
    # prompts user for "back" to go back to genres or "exit" to quit the program
    user_decision = gets.strip
    if user_decision == "back"
      list_genres
      get_user_genre
    elsif user_decision == "exit"
      exit
    else
      puts "Invalid. Type 'back' to return to genres or 'exit' to end the program.".yellow.bold
      get_user_decision
    end
  end
  
  def valid_input?(input, data)
    # valid_input?: Does the user input fall between the range of listed genres?
    input.to_i <= data.length && input.to_i > 0
  end
  
  def show_movies(chosen_genre)
    genre = @genres[chosen_genre - 1]
    puts "Here are the current Top 50 #{genre.name.strip} movies on IMDB:".yellow.bold
    genre.movies_to_show.each.with_index(1) do |movie, index|
      puts "#{index}. #{movie.name.strip.yellow} #{movie.year.yellow} #{movie.rating}/10"
    end
    puts "Type 'back' to return to the genres or 'exit' to end the program.".yellow.bold
    get_user_decision
  end
end