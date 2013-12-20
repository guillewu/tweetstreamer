class Tweet
  include Mongoid::Document
  field :created_at, type: DateTime
  field :text, type: String
  field :screen_name, type: String
  field :coordinates, type: Array
  index({ created_at: 1 }, { expire_after_seconds: 14400 })
  index({:coordinates => "2d"}, {background: true})

  def self.search(params)
    p "hello"
    p params[:lat]
    self.near(coordinates: [params[:lat].to_f, params[:long].to_f]).max_distance(coordinates: params[:radius].to_f)
  end
end