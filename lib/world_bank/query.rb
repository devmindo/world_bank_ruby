module WorldBank
  class Query
    attr_reader :pages, :total

    def initialize(name, id, model)
      @model = model
      @name = name
      @id = id
      @lang = false
      @raw = false
      @new = true
      @query = {params: {format: :json}, dirs: []}
      @param_dir = []
    end

    #
    # the date param is expressed as a range 'StartDate:EndDate'
    # Date may be year & month, year & quarter, or just year
    # Date will convert any Date/Time object to an apporpriate year & month
    #
    def dates(date_range)
      if date_range.is_a? String

        # assume the user knows what she is doing if passed a string
        @query[:params][:date] = date_range
      elsif date_range.is_a? Range
        start = date_range.first
        last = date_range.last
        @query[:params][:date] = "#{start.strftime("%YM%m")}:#{last.strftime("%YM%m")}"
      end
      self
    end

    def format(format)
      @query[:params][:format] = format
      self
    end

    def raw
      @raw = true
      self
    end

    def id(id)
      @query[:params][:id] = id
      self
    end

    #
    # Most Recent Values param has two optional params
    # Gap fill will specify how many items to add if there isn't enough data for you query
    # Frequency sets how frequent the data sets are...
    # An example is best to explain this:
    # I want the 5 most recent yearly values between 2000 and 2010,
    #   but I need at least three data sets to continue. My query would look like this:
    #   .dates('2000:2010').most_recent_values(:gap_fill => 3, :frequency => 'Y')
    #
    def most_recent_values(num, options = {})
      @query[:params][:gapFill] = options[:gap_fill] if options[:gap_fill]
      @query[:params][:frequency] = options[:frequency] if options[:frequency]
      @query[:params][:MRV] = num
      self
    end

    def per_page(num = false)
      if num
        @query[:params][:perPage] = num
        self
      else
        @per_page || @query[:params][:per_page] || 50
      end
    end

    def page(num = false)
      if num
        @query[:params][:page] = num
        self
      else
        @page || @query[:params][:page] || 1
      end
    end

    def next
      if @query[:params][:page].nil?
        @query[:params][:page] = 2
      else
        @query[:params][:page] += 1
      end
      self
    end

    def language(lang)
      @lang = if lang.to_s.length == 2
        lang.to_s.downcase
      else
        [["french", "fr"],
          ["spanish", "es"],
          ["english", "en"],
          ["arabic", "ar"]].assoc(lang.to_s.downcase)[1]
      end
      self
    end

    def cycle
      @cycle_results = @pages.nil? ? fetch : []
      (@pages - page).times do
        @cycle_results += self.next.fetch
      end
      @cycle_results
    end

    def fetch
      if @new
        @query[:dirs].push @name
        @query[:dirs].push @id
        @query[:dirs].unshift @lang if @lang
        @query[:params][:format] ||= :json
        @new = false
      end
      @query[:dirs] = @param_dir + @query[:dirs] unless @param_dir.empty?
      client = WorldBank::Client.new(@query, @raw)
      results = client.get_query
      results = parse results unless @raw
      results
    end

    protected

    def parse(results)
      update_fetch_info(results[0])
      if @id =~ /all/ || @model == WorldBank::Data
        results[1].map { |result| @model.new result }
      else
        @model.new results[1][0]
      end
    end

    def update_fetch_info(meta_info)
      @page = meta_info["page"].to_i
      @per_page = meta_info["per_page"].to_i
      @pages = meta_info["pages"].to_i
      @total = meta_info["total"].to_i
    end

    def indifferent_number(possibly_multiple_args)
      if possibly_multiple_args.is_a?(Array)
        arr = possibly_multiple_args.map do |arg|
          indifferent_type(arg)
        end
        arr.join(";")
      else
        indifferent_type(possibly_multiple_args)
      end
    end

    def indifferent_type(arg)
      if arg.is_a?(String) || arg.is_a?(Numeric)
        arg
      else
        arg.id
      end
    end

    def ensure_country_id(id)
      @country_id = id
      if @country_id.length > 3
        @matching = WorldBank::Country.country_aliases.select do |country|
          country[2] =~ Regexp.new(@country_id)
        end
        if @matching.length > 1
          raise ArgumentError,
            "More than one country code matched '#{@country_id}'. Perhaps you meant one of #{@matching.join(", ")}?",
            caller
        elsif @matching.length == 0
          raise ArgumentError,
            "No countries matched '#{@country_id}', please try again.",
            caller
        else
          @country_id = @matching[0][0]
        end
      end
      @country_id
    end

    def indifferent_nums(args)
      if args.is_a? Array
        parsed = args.map! do |arg|
          arg = normalize_country_id arg
          ensure_country_id arg
        end.join(";")
      else
        args = normalize_country_id args
        parsed = ensure_country_id args
      end
      parsed
    end

    def normalize_country_id(id)
      id.gsub!(/[ -]/, "_")
      id.downcase
    end
  end
end
