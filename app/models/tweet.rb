class Tweet
  include Mongoid::Document
  field :created_at, type: DateTime
  field :text, type: String
  field :coordinates, type: Array
  index({ created_at: 1 }, { expire_after_seconds: 14400 })
  index({:coordinates => "2d"}, {background: true})

  def self.search(params)
    if params[:long].blank?
      self.all
    else
      self.near(coordinates: [params[:long].to_f, params[:lat].to_f]).max_distance(coordinates: params[:radius].to_f)
    end
  end
end
