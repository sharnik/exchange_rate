require_relative '../spec_helper'

module ExchangeRate
  describe XMLImporter do
    before do
      @importer = XMLImporter.new(File.path('spec/fixtures/import_stream.xml'))
    end

    describe '#import' do
      before do
        @rates = @importer.import
      end

      it 'returns a Hash' do
        assert @rates.is_a?(Hash)
      end

      it 'separates rates by dates' do
        refute @rates['2013-10-09'].nil?
      end

      it 'contains correct CZK rate' do
        czk_rate = @rates['2013-10-09'].select do |rate|
          rate[:currency] == 'CZK'
        end.first
        assert(czk_rate[:rate] == 25.598)
      end
    end
  end
end
