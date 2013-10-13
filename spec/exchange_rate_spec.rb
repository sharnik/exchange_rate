require_relative 'spec_helper'

describe ExchangeRate do
  before do
    tmpfile = Tempfile.new('exchange_rates')
    ExchangeRate.set_store tmpfile.path
    ExchangeRate.set_source File.path('spec/fixtures/import_stream.xml')
  end

  it 'can get and display exchange rates' do
    skip 'Not implemented yet.'
    ExchangeRate.update_rates
    ExchangeRate.at('2013-10-08', 'CZK', 'GBP')
  end
end

