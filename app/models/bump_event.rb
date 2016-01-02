class BumpEvent < ActiveRecord::Base

  has_many :bump_event_matches
  has_many :matched_events, through: :bump_event_matches,
                            dependent: :destroy

  scope :recent, ->(){where('bump_events.created_at >= :time_ago',:time_ago => Time.now - 10.seconds) }
  scope :nearby, ->(point){where('ST_Distance(lonlat, :point) < :distance',:point => point.as_text, :distance => 10)}

  scope :not_matched_to, ->(bump_event_id) {
    where.not(id: BumpEventMatch.select(:matched_event_id).where(bump_event: bump_event_id))
  }

  scope :bump_matches, ->(bump_event) {
    recent.nearby(bump_event.lonlat).not_matched_to(bump_event.id).where.not(id: bump_event.id)
  }


  def link_to_nearby_bumps()
    matched_events << BumpEvent.bump_matches(self)
  end

end
