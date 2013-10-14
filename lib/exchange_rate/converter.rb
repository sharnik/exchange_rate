module ExchangeRate
  class Converter
    attr_reader :rate_from, :rate_to

    def initialize(rate_from, rate_to)
      @rate_from = rate_from
      @rate_to = rate_to
    end

    def compute_rate
      (@rate_from / @rate_to).round(4)
    end

  end
end
