require "json"
require "net/http"

class YahooQueryService
  def initialize(symbol:)
    @symbol = symbol
  end

  def fetch_opening_price
    quote = JSON.parse(fetch_body)["query"]["results"]["quote"]
    quote["Open"]
  end

  private

  def fetch_body
    Net::HTTP.get(URI(url))
  end

  def url
    "http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.quotes%20where%20symbol%20in%20(%22#{@symbol}%22)&format=json&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback="
  end
end
