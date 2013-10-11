require_relative 'exchange_rate/importer'
require_relative 'exchange_rate/xml_importer'

module ExchangeRate

  # Public: Downloads the exchange rates.
  #
  # Returns nothing.
  def self.download_rates
    ExchangeRate::XMLImporter.new('http://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml').import
  end

end
