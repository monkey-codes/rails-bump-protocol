class RoutesTest < ActionDispatch::IntegrationTest
  test 'routes version' do
    assert_generates '/api/v1/bump_events', {controller: 'api/v1/bump_events', action: 'create'}
    assert_generates '/api/v1/bump_events/1', {controller: 'api/v1/bump_events', action: 'show', id: '1'}
  end
end

