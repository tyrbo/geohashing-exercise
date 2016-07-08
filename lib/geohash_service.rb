require "json"

require_relative "./destination_service"
require_relative "./yahoo_query_service"

class GeohashService
  def initialize(latitude:, longitude:)
    @latitude = latitude
    @longitude = longitude
  end

  def call
    open = YahooQueryService.new(symbol: "^NDX").fetch_opening_price

    destination = DestinationService.new(
      latitude: @latitude,
      longitude: @longitude,
      open: open
    ).calculate_destination

    destination.to_json
  end
end
