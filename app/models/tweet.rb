class Tweet
  include Mongoid::Document
  field :created_at, type: DateTime
  field :text, type: String
  field :screen_name, type: String
  field :coordinates, type: Array
  index({ created_at: 1 }, { expire_after_seconds: 14400 })
end