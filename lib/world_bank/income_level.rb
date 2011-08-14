module WorldBank

  class IncomeLevel

    attr_reader :raw, :id, :name, :type

    def self.client
      @client ||= WorldBank::Client.new
    end

    def self.optionally_parse(results, args, many=false)
      opts = args.last || {}
      if many
        results = results[1].map { |result| new result } unless opts[:raw]
      else
        results = new results[1][0] unless opts[:raw]
      end
      results
    end    

    def self.all(*args)
      client.query[:dirs] = ['incomeLevels']
      results = client.get_query
      optionally_parse results, args, :many
    end

    def self.find(id, *args)
      client.query[:dirs] = ['incomeLevels', id.to_s]
      result = client.get_query
      optionally_parse results, args
    end

    def initialize(values={})
      @raw = values
      @id = values['id']
      @name = values['value']
      @type = 'incomeLevels'
    end
  end

end
