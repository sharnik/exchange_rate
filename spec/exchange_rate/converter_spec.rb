require_relative '../spec_helper'

module ExchangeRate
  describe Converter do
    before { @converter = Converter.new(1.3566, 0.849) }

    describe '#initialize' do
      it 'sets the source rate' do
        assert @converter.rate_from == 1.3566
      end

      it 'sets the target rate' do
        assert @converter.rate_to == 0.849
      end
    end

    describe '#compute_rate' do
      it 'should return proper excchange rate' do
        assert @converter.compute_rate == 1.5979
      end
    end
  end
end
