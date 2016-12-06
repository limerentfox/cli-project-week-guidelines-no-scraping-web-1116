
class GiphyCLI

  def call
    puts "Welcome!!! It's time to find ALLLLL the gifs!!!"
    run
  end

  def get_user_input
    gets.chomp.downcase.strip
  end


  extend Rainbowize
#  color_puts("what do you want to do?")


  def run
    help
    self.class.color_pts("What do you want to do? ")
    input = get_user_input
    if input == "exit" || input == "e"
      exit
    elsif input == 'random' || input == "r"
      print "Please enter a keyword to search: "
      random_input = get_user_input
      random(random_input)
    elsif input == 'allll' || input == "a"
      print "Please enter a keyword to search: "
      all_input = get_user_input
      allll(all_input)
    # elsif input == "help" || input == "h"
    #     help

    end


    run



    # print "Please enter a keyword to search: " help
    # input = get_user_input
    # run
  end

  def populate_gif_class(input)
    search_term = input.split(" ").join("%20").downcase
    puts
    puts "Your search term was #{input.capitalize}, I am searching..."
    puts
    url = "http://api.giphy.com/v1/gifs/search?q=#{search_term}&api_key=#{APIKEY}"

    gifs = GiphyApiAdapter.new(url).make_gifs

    #list
  end

  def help
    puts
    puts "Commands:"
    puts "  • (r)andom : search for a random gif from Giphy"
    puts "  • (a)llll  : to get ALLLLLLLLL the info about ALLLLLLL the gifffs"
    puts "  • (e)xit   : goodbye, friends"
    #puts "  • help   : see this message again"
    puts
  end

  def random(input)
    populate_gif_class(input)
    Launchy.open(Gif.random_gif.url)

    Gif.reset
  end

  def allll(input)
    populate_gif_class(input)
    Gif.present_all
    Gif.reset
  end

  def list
    puts "Thank you for your patience. I found this on Giphy:"
      Gif.present_all
      Gif.reset
    end



end
