require 'nokogiri'

module ExchangeRate
  class XMLImporter < Importer

    # Public: Imports exchange rates from source.
    #
    # Returns Hash containing the rates.
    def import
      data = open(source_url)
      parse_document_structure Nokogiri::XML(data)
    end

    private

    def parse_document_structure(doc)
      result = {}
      doc.css('Cube[time]').each do |node|
        result[node[:time]] = parse_daily_data node
      end

      result
    end

    def parse_daily_data(elem)
      result = []
      elem.css('Cube').each do |node|
        result << {:currency => node[:currency], :rate => node[:rate].to_f}
      end

      result
    end

  end
end
