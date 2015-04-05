require 'nokogiri'
require 'faraday'
require 'faraday_middleware'
require 'pry'

module Littlenoah

module Scraper

  class Famitsu
    def initialize
      @cache = {}
    end

    private
    def baseuri
      'http://wiki.famitsu.com'
    end

    def path(p)
      return "/littlenoah" + p
    end

    def top_page
      @cache[path("/")] ||= begin
        Nokogiri::HTML(connection.get(path("/")).body)
      end
    end

    def connection
      @connection ||= begin 
        Faraday.new(:url => baseuri) do |connection|
          connection.adapter :net_http
          connection.response :logger
        end
      end
    end
  end

end

end
