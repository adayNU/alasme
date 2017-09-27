class IndexController < ApplicationController
  BASE_URL = "http://api.giphy.com"
  ENDPOINT = "v1/gifs/random"
  GIF_TAG = "disappointed"
  USER_AGENT_REGEX = /(Twitterbot(.*)facebookexternalhit)|(facebookexternalhit(.*)Twitterbot)/

  def show
    # if iMessage return mp4 instead of gif
    link_type = (USER_AGENT_REGEX.match(request.user_agent) ? "url" : "image_url")

    url = "#{BASE_URL}/#{ENDPOINT}?tag=#{GIF_TAG}&api_key=#{API_KEYS["giphy"]["key"]}"
    result = RestClient.get(url)

    json = JSON.parse(result.body)
    redirect_to json["data"][link_type]
  end
end
