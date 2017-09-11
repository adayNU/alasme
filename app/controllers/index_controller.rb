class IndexController < ApplicationController
  BASE_URL = "http://api.giphy.com"
  ENDPOINT = "v1/gifs/random"
  GIF_TAG = "disappointed"

  def show
    url = "#{BASE_URL}/#{ENDPOINT}?tag=#{GIF_TAG}&api_key=#{API_KEYS["giphy"]["key"]}"
    result = RestClient.get(url)

    json = JSON.parse(result.body)
    redirect_to json["data"]["image_url"]
  end
end