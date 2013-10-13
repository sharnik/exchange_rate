require 'pstore'

class Store
  attr_reader :file, :data

  def initialize(file = nil)
    @file = file || 'rates.pstore'
    @data = PStore.new(@file)
  end

  def get_rate(date, currency)
    @data.transaction(true) do
      daily_rates = @data[date]
      daily_rates.select { |el| el[:currency] == currency }.first[:rate]
    end
  end

  def update_rates(rates)
    @data.transaction do
      rates.each do |key, value|
        @data[key] = value
      end
    end
  end

end
