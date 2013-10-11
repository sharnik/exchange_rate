require 'open-uri'

module ExchangeRate
  class Importer
    attr_reader :source_url

    def initialize(source_url)
      @source_url = source_url
    end

    # Public: Imports exchange rates from source.
    #
    # Returns Hash containing the rates.
    def import
      raise "That's weird, it's supposed to be overridden."
    end

  end
end
