require_relative 'exchange_rate/importer'
require_relative 'exchange_rate/xml_importer'
require_relative 'exchange_rate/converter'
require_relative 'exchange_rate/store'

module ExchangeRate
  class << self

    # Public: Updates the exchange rates.
    #
    # Returns nothing.
    def update_rates
      store.update_rates ExchangeRate::XMLImporter.new(source).import
    end

    # Public: Finds the exchange rate.
    #
    # date - String containing a date of the rate in "2013-10-27" format.
    # currency_from - String containing origin currency code in "CZK" format.
    # currency_from - String containing target currency code in "GBP" format.
    #
    # Returns Float of the exchange rate.
    def at(date, currency_from, currency_to)
      rate_from = currency_from == 'EUR' ? 1.0 : store.get_rate(date, currency_from)
      rate_to = currency_to == 'EUR' ? 1.0 : store.get_rate(date, currency_to)

      Converter.new(rate_from, rate_to).compute_rate
    end

    # Public: Allows to set store file.
    #
    # file - String containing the desired filename or path.
    #
    # Returns nothing.
    def set_store(file)
      @store = Store.new(file)
    end

    # Public: Allows to set data source.
    #
    # source - String containing file path or URL of data source.
    #
    # Returns nothing.
    def set_source(source)
      @source = source
    end

    # Public: Get the persistence engine.
    #
    # Returns Store.
    def store
      @store ||= Store.new
    end

    private

    def source
      @source ||= 'http://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml'
    end

  end
end
