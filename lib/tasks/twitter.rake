desc "get tweets"
task :get_feed => :environment do
  TweetStream.configure do |config|
    config.consumer_key = "STJaPlhbJk90czMNarZPw"
    config.consumer_secret = "8LI77xrCMkLzc3fKVHWdC2g65sXsF2ZtjnLkbVs"
    config.oauth_token = "868331905-JnPreIT1sO8W2eE0RWad33uR6rxtKjc1bjQRU5xS"
    config.oauth_token_secret = "dwS337Q0SyDlSJ3L2FhN32xYDFzzbzg7kViWELy7ehi91"
    config.auth_method = :oauth
  end

  TweetStream::Client.new.start('/1.1/statuses/filter.json', :locations => "-180,-90,180,90", :method => :post) do |status|
    t = Tweet.create(created_at: status.created_at, text: status.text, screen_name: status.user.screen_name, coordinates: status.geo.coordinates)
  end
end


# '-122.75,36.8,-121.75,37.8'