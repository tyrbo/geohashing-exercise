require_relative  "./test_helper"
require "destination_service"

class DestinationServiceTest < Minitest::Test
  def test_calculate_destination_returns_new_coords
    destination = DestinationService.new(latitude: 1, longitude: 2, open: 3)
    expected = { lat: 1.2730072329276652, lon: 2.289597272664098 }

    assert_equal expected, destination.calculate_destination
  end
end
