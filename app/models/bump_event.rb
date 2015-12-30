class BumpEvent < ActiveRecord::Base
  scope :recent, ->(){where('created_at >= :time_ago',:time_ago => Time.now - 10.days) }
  scope :nearby, ->(point){where('ST_Distance(lonlat, :point) < :distance',:point => point.as_text, :distance => 10)}
end
