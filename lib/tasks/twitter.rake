desc "get tweets"
task :get_feed => :environment do
  TweetStream.configure do |config|
    config.consumer_key = ENV["CONSUMER_KEY"]
    config.consumer_secret = ENV["CONSUMER_SECRET"]
    config.oauth_token = ENV["OAUTH_TOKEN"]
    config.oauth_token_secret = ENV["OAUTH_TOKEN_SECRET"]
    config.auth_method = :oauth
  end

  TweetStream::Client.new.start('/1.1/statuses/filter.json', :locations => "-180,-90,180,90", :method => :post) do |status|
    t = Tweet.create(created_at: status.created_at, text: status.text, screen_name: status.user.screen_name, coordinates: status.geo.coordinates)
  end
end


# '-122.75,36.8,-121.75,37.8'