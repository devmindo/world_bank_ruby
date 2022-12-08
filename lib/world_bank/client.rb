require "faraday"
require "faraday/mashify"
require "faraday/decode_xml"
require File.expand_path(File.join(File.dirname(__FILE__), "source"))
require File.expand_path(File.join(File.dirname(__FILE__), "income_level"))
require File.expand_path(File.join(File.dirname(__FILE__), "lending_type"))
require File.expand_path(File.join(File.dirname(__FILE__), "country"))
require File.expand_path(File.join(File.dirname(__FILE__), "indicator"))
require File.expand_path(File.join(File.dirname(__FILE__), "topic"))
require File.expand_path(File.join(File.dirname(__FILE__), "region"))
require File.expand_path(File.join(File.dirname(__FILE__), "query"))
require File.expand_path(File.join(File.dirname(__FILE__), "data"))
require File.expand_path(File.join(File.dirname(__FILE__), "param_query"))
require File.expand_path(File.join(File.dirname(__FILE__), "data_query"))

module WorldBank
  class Client
    attr_accessor :query

    def initialize(query, raw)
      @query = query
      @raw = raw
    end

    def get_query
      @path = @query[:dirs].join("/")
      @path += "?"
      params = []
      @query[:params].each do |key, value|
        params << "#{key}=#{value}"
      end
      @path += params.join("&")
      get(@path)
    end

    def get(path, headers = {})
      response = connection.get do |request|
        request.url(path, headers)
      end
      response.body
    end

    private

    def connection
      Faraday.new(url: "https://api.worldbank.org/v2/") do |connection|
        connection.request :url_encoded

        connection.response :raise_error
        connection.response :mashify
        unless @raw
          case @query[:params][:format].to_s.downcase
          when "json"
            connection.response :json
          when "xml"
            connection.response :xml
          end
        end
        connection.adapter Faraday.default_adapter
      end
    end
  end
end
