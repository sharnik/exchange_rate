require_relative '../spec_helper'

module ExchangeRate
  describe Importer do

    describe '#initialize' do
      it 'sets the data source' do
        importer = Importer.new('data_source')
        assert importer.source_url == 'data_source'
      end
    end
  end
end
