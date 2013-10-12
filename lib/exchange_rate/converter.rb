module ExchangeRate
  class Converter
    attr_reader :currency_from, :currency_to

    def initialize(currency_from, currency_to)
      @currency_from = currency_from
      @currency_to = currency_to
    end

  end
end
