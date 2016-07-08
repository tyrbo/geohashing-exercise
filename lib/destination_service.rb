class DestinationService
  def initialize(latitude:, longitude:, open:)
    @latitude = latitude
    @longitude = longitude
    @open = open.to_s
  end

  def calculate_destination
    md5 = Digest::MD5.hexdigest(@open)

    first, second = split_md5(md5)

    {
      lat: replace_decimals(@latitude, hex_to_decimal(first)),
      lon: replace_decimals(@longitude, hex_to_decimal(second))
    }
  end

  private

  def hex_to_decimal(hex)
    hex.to_i(16).to_s(10)
  end

  def replace_decimals(orig, replacement)
    left, _ = orig.to_s.split(".")
    "#{left}.#{replacement}".to_f
  end

  def split_md5(md5)
    half = md5.length / 2

    [
      md5[0..half],
      md5[half..-1]
    ]
  end
end
