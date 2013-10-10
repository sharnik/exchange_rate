require_relative 'exchange_rate/importer'

module ExchangeRate

  # Public: Downloads the exchange rates.
  #
  # Returns nothing.
  def self.download_rates
    ExchangeRate::Importer.new('http://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml').import
  end

end
