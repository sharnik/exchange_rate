require_relative 'spec_helper'

describe ExchangeRate do
  before do
    tmpfile = Tempfile.new('exchange_rates')
    ExchangeRate.set_store tmpfile.path
    ExchangeRate.set_source File.path('spec/fixtures/import_stream.xml')
  end

  it 'can get and display exchange rates' do
    ExchangeRate.update_rates
    assert ExchangeRate.at('2013-10-08', 'CZK', 'GBP') == 30.283
  end

  it 'raise an exception when rate is not available' do
    assert_raises(ExchangeRate::RateNotAvailable) do
      ExchangeRate.at('2013-10-08', 'CZK', 'GBP')
    end
  end
end

