class TweetsController < ApplicationController
  def feed
    system "rake get_feed COORDS=#{params[:coords]} &"
  end

  def index
    @tweets = Tweet.search(params).desc(:created_at).page(params[:page])
    # nearby = Tweet.near(coordinates: [37.3828, -121.8238]).max_distance(coordinates: 0.5)
  end
end
