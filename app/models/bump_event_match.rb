class BumpEventMatch < ActiveRecord::Base
  belongs_to :bump_event
  belongs_to :matched_event, class_name: "BumpEvent"
end
