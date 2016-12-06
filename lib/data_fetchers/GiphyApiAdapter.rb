class GiphyApiAdapter

  attr_reader :url, :gif_data

  def initialize(url)
    @url = url
    @gif_data = JSON.parse(RestClient.get(url))
  end

  def make_gifs
    gifs = []
    all_gifs = gif_data["data"]
    all_gifs.each do |gif|
      gif_id = gif["id"]
      gif_url = gif["url"]
      gif_source = gif["source"]
      gifs << Gif.new(gif_id, gif_url, gif_source)
    end
    gifs
  end

end
