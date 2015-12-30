class BumpEventsTest < ActionDispatch::IntegrationTest


  test 'it shows a bump event' do
    event = BumpEvent.create!(device_id: '123',lonlat: 'POINT(-122.3989885 37.7905576)')
    get "/api/v1/bump_events/#{event.id}"
    assert_equal 200, response.status
    event_response = JSON.parse(response.body, symbolize_names: true)
    assert_equal event.device_id, event_response[:device_id]
  end

  test 'it creates bump events' do
    # curl -i -X POST -d 'bump_event[device_id]=12&bump_event[latitude:12.00]&bump'
    # curl -H "Content-Type: application/json" -X POST -d '{"device_id":"123","lonlat":{"type":"Point", "coordinats":[-122.3989885,37.7905576]}}' http://localhost:3000/api/v1/bump_events
    post '/api/v1/bump_events',
      { bump_event:
        {
        device_id: '123',
        lonlat: {
          type: 'Point',
          coordinates: [-122.3989885,37.7905576]
        }
      }
    }.to_json,
    {'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s}
    assert_equal 201, response.status
    assert_equal Mime::JSON, response.content_type
    bump_event = JSON.parse(response.body, symbolize_names: true)
    assert_equal api_v1_bump_event_url(bump_event[:id]), response.location
    assert_not_nil bump_event[:lonlat]
  end
end
