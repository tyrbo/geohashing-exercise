require "json"

require "destination_service"
require "yahoo_query_service"

class GeohashService
  def initialize(latitude:, longitude:)
    @latitude = latitude
    @longitude = longitude
  end

  def call
    response = YahooQueryService.new(symbol: "^NDX").fetch_opening_price

    destination = DestinationService.new(
      latitude: @latitude,
      longitude: @longitude,
      response: response
    ).calculate_destination

    destination.to_json
  end
end
