class GiphyCLI

  def call
    puts "Welcome!!! It's time to find ALLLLL the gifs!!!"
    run
  end

  def get_user_input
    gets.chomp.strip
  end

  def run
    puts "What do you want to do?"
    help
    print "Please enter a keyword to search: "
    input = get_user_input
    if input == "help"
      help
    elsif input == "exit"
      exit
    elsif input == 'random'
      random(input)
    elsif input == 'allll'
      allll
    else
      search(input)
    end
    run
  end

  def search(input)
    search_term = input.split(" ").join("%20").downcase
    puts "Your search term was #{input.capitalize}, I am searching..."
    url = "http://api.giphy.com/v1/gifs/search?q=#{search_term}&api_key=dc6zaTOxFJmzC"

    gifs = GiphyApiAdapter.new(url).make_gifs

    list
  end

  def help
    puts "Type 'random' to get a random gif from your keyword search"
    puts "Type 'allll' to get ALLLLLLLLL of your gifffs"
    puts "Type 'exit' to exit"
    puts "Type 'help' to view this menu again"
    puts "Type anything else to search for morrrrreeee gifs!!!!"
  end

  def random(input)
    search(input)
    Gif.random_gif
    Gif.reset
  end

  def allll
    search(input)
    Gif.present_all
    Gif.reset
  end

  def list
    puts "Thank you for your patience. I found this on Giphy:"
      Gif.present_all
      Gif.reset
    end



end
