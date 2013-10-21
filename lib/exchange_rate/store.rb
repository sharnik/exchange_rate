require 'pstore'

module ExchangeRate
  class RateNotAvailable < Exception; end

  class Store
    attr_reader :file, :data

    # Public: Object initialisation.
    #
    # file - Filename for the PStore file. Defaults to 'rates.pstore'.
    #
    # Returns self.
    def initialize(file = nil)
      @file = file || 'rates.pstore'
      @data = PStore.new(@file)
    end

    # Public: Gets exchange rate for provided date and currency.
    #
    # date - String containing the date in format "2013-10-25".
    # currency - String containing currency code. All uppercase, for example 'CZK'.
    #
    # Returns Float with the exchange rate.
    def get_rate(date, currency)
      result = @data.transaction(true) do
        daily_rates = @data[date] || []
        daily_rates.select { |el| el[:currency] == currency }.first
      end

      result.nil? ? raise(RateNotAvailable) : result[:rate]
    end

    # Public: Updates (overwrites when needed) the rates storage with provided hash.
    #
    # rates - Hash containing new exchange rates.
    #
    # Returns nothing.
    def update_rates(rates)
      @data.transaction do
        rates.each do |key, value|
          @data[key] = value
        end
      end
    end

  end
end
