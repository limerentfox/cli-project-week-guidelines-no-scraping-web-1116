class Gif
  attr_reader :id, :url, :source
  ALL = []

  def initialize(id, url, source)
    @id = id
    @url = url
    @source = source
    self.class.all << self
  end

  def self.all
    ALL
  end

  def self.present_all
    gifs = self.all
    gifs.each do |gif|
      puts "-----------------------------"
      puts "  • ID     : #{gif.id}"
      puts "  • URL    : #{gif.url}"
      puts "  • SOURCE : #{gif.source}"


  end
      puts
      puts "WOW that is a LOT of gifs! #{gifs.count} to be exact"
      puts
  end

  def self.reset
    all.clear
  end

  def self.random_gif
    gifs = self.all
    random_gif = gifs.sample
      puts "Attempting to open:"
      puts "  • ID     : #{random_gif.id}"
      puts "  • URL    : #{random_gif.url}"
      puts "  • SOURCE : #{random_gif.source}"
      puts
    random_gif
  end

    def self.count
      all.count
    end

end
