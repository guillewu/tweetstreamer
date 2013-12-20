class TweetsController < ApplicationController
  def feed
    system "rake get_feed COORDS=#{params[:coords]} &"
  end
end
