module WorldBank
  class ParamQuery < Query
    def lending_type(lending_type)
      parsed = indifferent_number lending_type
      @query[:params][:lendingTypes] = parsed
      self
    end

    def income_level(income_levels)
      parsed = indifferent_number income_levels
      @query[:params][:incomeLevels] = parsed
      self
    end

    def region(regions)
      parsed = indifferent_number regions
      @query[:params][:countries] = parsed
      self
    end

    def country(country)
      parsed = indifferent_type country
      parsed = ensure_country_id parsed
      @query[:params][:countries] = parsed
      self
    end

    def indicator(indicators)
      parsed = indifferent_number indicators
      @query[:params][:indicators] = parsed
      self
    end

    def featured_indicators
      @query[:params][:featured] = 1
      self
    end

    def source(sources)
      parsed = indifferent_number sources
      @query[:params][:sources] = parsed
      self
    end
  end
end
