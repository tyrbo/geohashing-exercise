require_relative  "./test_helper"
require "geohash_service"

class GeohashServiceTest < Minitest::Test
  def test_call_returns_geohash_json
    geohash = GeohashService.new(latitude: 1, longitude: 2)

    assert_equal [2.5, 5.0], geohash.call
  end
end
