require_relative  "./test_helper"
require "json"
require "mocha/mini_test"
require "net/http"

require "yahoo_query_service"

class YahooQueryServiceTest < Minitest::Test
  def test_fetch_opening_price
    query = YahooQueryService.new(symbol: "^NDX")

    Net::HTTP.stubs(:get).returns(json)

    assert_equal query.fetch_opening_price, "4484.92"
  end

  def json
    {
      query: {
        results: {
          quote: {
            "symbol" => "^NDX",
            "Open" => "4484.92"
          }
        }
      }
    }.to_json
  end
end

