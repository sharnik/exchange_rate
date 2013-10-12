require_relative '../spec_helper'

module ExchangeRate
  describe Converter do
    before { @converter = Converter.new('CZK', 'GBP') }

    describe '#initialize' do
      it 'sets the source currency' do
        assert @converter.currency_from == 'CZK'
      end

      it 'sets the source currency' do
        assert @converter.currency_to == 'GBP'
      end
    end
  end
end
