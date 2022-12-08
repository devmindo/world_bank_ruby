module WorldBank
  class Country
    COUNTRY_ALIASES = [
      ["AW", "ABW", "aruba"],
      ["AF", "AFG", "afganistan"],
      ["AO", "AGO", "angola"],
      ["AI", "AIA", "anguilla"],
      ["AX", "ALA", "aland_islands"],
      ["AL", "ALB", "albania"],
      ["AD", "AND", "andorra"],
      ["AE", "ARE", "united_arab_emirates"],
      ["AR", "ARG", "argentina"],
      ["AM", "ARM", "armenia"],
      ["AS", "ASM", "american_samoa"],
      ["AQ", "ATA", "antarctica"],
      ["TF", "ATF", "french_southern_territories"],
      ["AG", "ATG", "antigua_and_barbuda"],
      ["AU", "AUS", "australia"],
      ["AT", "AUT", "austria"],
      ["AZ", "AZE", "azerbaijan"],
      ["BI", "BDI", "burundi"],
      ["BE", "BEL", "belgium"],
      ["BJ", "BEN", "benin"],
      ["BQ", "BES", "bonaire_saint_eustatius_and_saba"],
      ["BF", "BFA", "burkina_faso"],
      ["BD", "BGD", "bangladesh"],
      ["BG", "BGR", "bulgaria"],
      ["BH", "BHR", "bahrain"],
      ["BS", "BHS", "bahamas"],
      ["BA", "BIH", "bosnia_and_herzegovina"],
      ["BL", "BLM", "saint_barthelemy"],
      ["BY", "BLR", "belarus"],
      ["BZ", "BLZ", "belize"],
      ["BM", "BMU", "bermuda"],
      ["BO", "BOL", "plurinational_state_of_bolivia"],
      ["BR", "BRA", "brazil"],
      ["BB", "BRB", "barbados"],
      ["BN", "BRN", "brunei_darussalam"],
      ["BT", "BTN", "bhutan"],
      ["BV", "BVT", "bouvet_island"],
      ["BW", "BWA", "botswana"],
      ["CF", "CAF", "central_african_republic"],
      ["CA", "CAN", "canada"],
      ["CC", "CCK", "cocos_keeling_islands"],
      ["CH", "CHE", "switzerland"],
      ["CL", "CHL", "chile"],
      ["CN", "CHN", "china"],
      ["CI", "CIV", "cote_divoire"],
      ["CM", "CMR", "cameroon"],
      ["CD", "COD", "democratic_republic_of_the_congo"],
      ["CG", "COG", "congo"],
      ["CK", "COK", "cook_islands"],
      ["CO", "COL", "colombia"],
      ["KM", "COM", "comoros"],
      ["CV", "CPV", "cape_verde"],
      ["CR", "CRI", "costa_rica"],
      ["CU", "CUB", "cuba"],
      ["CW", "CUW", "curacao"],
      ["CX", "CXR", "christmas_island"],
      ["KY", "CYM", "cayman_islands"],
      ["CY", "CYP", "cyprus"],
      ["CZ", "CZE", "czech_republic"],
      ["DE", "DEU", "germany"],
      ["DJ", "DJI", "djibouti"],
      ["DM", "DMA", "dominca"],
      ["DK", "DNK", "denmark"],
      ["DO", "DOM", "dominican_republic"],
      ["DZ", "DZA", "algeria"],
      ["EC", "ECU", "ecuador"],
      ["EG", "EGY", "egypt"],
      ["ER", "ERI", "eritrea"],
      ["EH", "ESH", "western_sahara"],
      ["ES", "ESP", "spain"],
      ["EE", "EST", "estonia"],
      ["ET", "ETH", "ethiopia"],
      ["FI", "FIN", "finland"],
      ["FJ", "FJI", "fiji"],
      ["FK", "FLK", "falkland_islands_malvinas"],
      ["FR", "FRA", "france"],
      ["FO", "FRO", "faroe_islands"],
      ["FM", "FSM", "federated_states_of_micronesia"],
      ["GA", "GAB", "gabon"],
      ["GB", "GBR", "united_kingdom"],
      ["GE", "GEO", "georgia"],
      ["GG", "GGY", "guernsey"],
      ["GH", "GHA", "ghana"],
      ["GI", "GIB", "gibraltar"],
      ["GN", "GIN", "guinea"],
      ["GP", "GLP", "guadeloupe"],
      ["GM", "GMB", "gambia"],
      ["GW", "GNB", "guinea_bissau"],
      ["GQ", "GNQ", "equatorial_guinea"],
      ["GR", "GRC", "greece"],
      ["GD", "GRD", "grenada"],
      ["GL", "GRL", "greenland"],
      ["GT", "GTM", "guatemala"],
      ["GF", "GUF", "french_guiana"],
      ["GU", "GUM", "guam"],
      ["GY", "GUY", "guyana"],
      ["HK", "HKG", "hong_kong"],
      ["HM", "HMD", "heard_island_mcdonald_islands"],
      ["HN", "HND", "honduras"],
      ["HR", "HRV", "croatia"],
      ["HT", "HTI", "haiti"],
      ["HU", "HUN", "hungary"],
      ["ID", "IDN", "indonesia"],
      ["IM", "IMN", "isle_of_man"],
      ["IN", "IND", "india"],
      ["IO", "IOT", "british_indian_ocean_territory"],
      ["IE", "IRL", "ireland"],
      ["IR", "IRN", "islamic_republic_of_iran"],
      ["IQ", "IRQ", "iraq"],
      ["IS", "ISL", "iceland"],
      ["IL", "ISR", "israel"],
      ["IT", "ITA", "italy"],
      ["JM", "JAM", "jamaica"],
      ["JE", "JEY", "jersey"],
      ["JO", "JOR", "jordan"],
      ["JP", "JPN", "japan"],
      ["KZ", "KAZ", "kazakhstan"],
      ["KE", "KEN", "kenya"],
      ["KG", "KGZ", "kyrgyzstan"],
      ["KH", "KHM", "cambodia"],
      ["KI", "KIR", "kiribati"],
      ["KN", "KNA", "saint_kitts_and_nevis"],
      ["KR", "KOR", "republic_of_korea"],
      ["KW", "KWT", "kuwait"],
      ["LA", "LAO", "lao_peoples_democratic_republic"],
      ["LB", "LBN", "lebanon"],
      ["LR", "LBR", "liberia"],
      ["LY", "LBY", "libyan_arab_jamahiriya"],
      ["LC", "LCA", "saint_lucia"],
      ["LI", "LIE", "liechtenstein"],
      ["LK", "LKA", "sri_lanka"],
      ["LS", "LSO", "lesotho"],
      ["LT", "LTU", "lithuania"],
      ["LU", "LUX", "luxembourg"],
      ["LV", "LVA", "latvia"],
      ["MO", "MAC", "macao"],
      ["MF", "MAF", "saint_martin"],
      ["MA", "MAR", "morocco"],
      ["MC", "MCO", "monaco"],
      ["MD", "MDA", "republic_of_moldova"],
      ["MG", "MDG", "madagascar"],
      ["MV", "MDV", "maldives"],
      ["MX", "MEX", "mexico"],
      ["MH", "MHL", "marshall_islands"],
      ["MK", "MKD", "the_former_yugoslav_republic_of_macedonia"],
      ["ML", "MLI", "mali"],
      ["MT", "MLT", "malta"],
      ["MM", "MMR", "myanmar"],
      ["ME", "MNE", "montenegro"],
      ["MN", "MNG", "mongolia"],
      ["MP", "MNP", "northern_mariana_islands"],
      ["MZ", "MOZ", "mozambique"],
      ["MR", "MRT", "mauritania"],
      ["MS", "MSR", "montserrat"],
      ["MQ", "MTQ", "martinique"],
      ["MU", "MUS", "mauritius"],
      ["MW", "MWI", "malawi"],
      ["MY", "MYS", "malaysia"],
      ["YT", "MYT", "mayotte"],
      ["NA", "NAM", "namibia"],
      ["NC", "NCL", "new_caledonia"],
      ["NE", "NER", "niger"],
      ["NF", "NFK", "norfolk_island"],
      ["NG", "NGA", "nigeria"],
      ["NI", "NIC", "nicaragua"],
      ["NU", "NIU", "niue"],
      ["NL", "NLD", "netherlands"],
      ["NO", "NOR", "norway"],
      ["NP", "NPL", "nepal"],
      ["NR", "NRU", "nauru"],
      ["NZ", "NZL", "new_zealand"],
      ["OM", "OMN", "oman"],
      ["PK", "PAK", "pakistan"],
      ["PA", "PAN", "panama"],
      ["PN", "PCN", "pitcairn"],
      ["PE", "PER", "peru"],
      ["PH", "PHL", "philippines"],
      ["PW", "PLW", "palau"],
      ["PG", "PNG", "papua_new_guinea"],
      ["PL", "POL", "poland"],
      ["PR", "PRI", "puerto_rico"],
      ["KP", "PRK", "democratic_peoples_republic_of_korea"],
      ["PT", "PRT", "portugal"],
      ["PY", "PRY", "paraguay"],
      ["PS", "PSE", "occupied_palestinian_territory"],
      ["PF", "PYF", "french_polynesia"],
      ["QA", "QAT", "qatar"],
      ["RE", "REU", "reunion"],
      ["RO", "ROU", "romania"],
      ["RU", "RUS", "russian_federation"],
      ["RW", "RWA", "rwanda"],
      ["SA", "SAU", "saudi_arabia"],
      ["SD", "SDN", "sudan"],
      ["SN", "SEN", "senegal"],
      ["SG", "SGP", "singapore"],
      ["GS", "SGS", "south_georgia_and_the_south_sandwich_islands"],
      ["SH", "SHN", "saint_helena_ascension_and_tristan_da_cunha"],
      ["SJ", "SJM", "svalbard_and_jan_mayen"],
      ["SB", "SLB", "soloman_islands"],
      ["SL", "SLE", "sierra_leone"],
      ["SV", "SLV", "el_salvador"],
      ["SM", "SMR", "san_marino"],
      ["SO", "SOM", "somalia"],
      ["PM", "SPM", "saint_pierre_and_miquelon"],
      ["RS", "SRB", "serbia"],
      ["ST", "STP", "sao_tome_and_principe"],
      ["SR", "SUR", "suriname"],
      ["SK", "SVK", "slovakia"],
      ["SI", "SVN", "slovenia"],
      ["SE", "SWE", "sweden"],
      ["SZ", "SWZ", "swaziland"],
      ["SX", "SXM", "sint_maarten"],
      ["SC", "SYC", "seychelles"],
      ["SY", "SYR", "syrian_arab_republic"],
      ["TC", "TCA", "turks_caicos_islands"],
      ["TD", "TCD", "chad"],
      ["TG", "TGO", "togo"],
      ["TH", "THA", "thailand"],
      ["TJ", "TJK", "tajikistan"],
      ["TK", "TKL", "tokelau"],
      ["TM", "TKM", "turkmenistan"],
      ["TL", "TLS", "timor_leste"],
      ["TO", "TON", "tonga"],
      ["TT", "TTO", "trinidad_and_tobago"],
      ["TN", "TUN", "tunisia"],
      ["TR", "TUR", "turkey"],
      ["TU", "TUV", "tuvalu"],
      ["TW", "TWN", "taiwan_provice_of_china"],
      ["TZ", "TZA", "united_republic_of_tanzania"],
      ["UG", "UGA", "uganda"],
      ["UA", "UKR", "ukraine"],
      ["UM", "UMI", "united_states_minor_outlying_islands"],
      ["UY", "URY", "uruguay"],
      ["US", "USA", "united_states_of_america"],
      ["UZ", "UZB", "uzbekistan"],
      ["VC", "VCT", "saint_vincent_and_the_grenadines"],
      ["VE", "VEN", "bolivarian_republic_of_venezuela"],
      ["VG", "VGB", "british_virgin_islands"],
      ["VI", "VIR", "us_virgin_islands"],
      ["VN", "VNM", "viet_nam"],
      ["VU", "VUT", "vanuatu"],
      ["WF", "WLF", "wallis_and_futuna"],
      ["WS", "WSM", "samoa"],
      ["YE", "YEM", "yemen"],
      ["ZA", "ZAF", "south_africa"],
      ["ZM", "ZMB", "zambia"],
      ["ZW", "ZWE", "zimbabwe"]
    ]

    attr_reader :raw, :name, :iso2_code, :iso3_code, :region, :income_level, :lending_type, :capital, :type

    def self.country_aliases
      COUNTRY_ALIASES
    end

    def self.format(arg)
      find("all").format(arg)
    end

    def self.id(arg)
      find("all").id(arg)
    end

    def self.most_recent_values(arg)
      find("all").most_recent_values(arg)
    end

    def self.page(arg)
      find("all").page(arg)
    end

    def self.per_page
      find("all").per_page(arg)
    end

    def self.language(arg)
      find("all").language(arg)
    end

    def self.income_level(arg)
      find("all").income_level(arg)
    end

    def self.lending_type(arg)
      find("all").lending_type(arg)
    end

    def self.region(arg)
      find("all").region(arg)
    end

    def self.country
      find("all").country(arg)
    end

    def self.indicators(arg)
      find("all").indicator(arg)
    end

    def self.fetch(arg)
      find(arg).fetch
    end

    def self.all
      find("all")
    end

    def self.find(id)
      id = normalize_id id
      id = ensure_id id unless /all/.match?(id)
      WorldBank::ParamQuery.new("countries", id, self)
    end

    def initialize(values = {})
      @raw = values
      @name = values["name"]
      @iso2_code = values["iso2Code"]
      @iso3_code = values["id"]
      @region = WorldBank::Region.new(values["region"])
      @income_level = WorldBank::IncomeLevel.new(values["incomeLevel"])
      @lending_type = WorldBank::LendingType.new(values["lendingType"])
      @capital = values["capitalCity"]
      @type = "countries"
    end

    private

    def self.ensure_id(id)
      @id = id
      if @id.length > 3
        @matching = COUNTRIES.select do |country|
          country[2] =~ Regexp.new(@id)
        end
        if @matching.length > 1
          raise ArgumentError,
            "More than one country code matched '#{@id}'. Perhaps you meant one of #{@matching.join(", ")}?",
            caller
        elsif @matching.length == 0
          raise ArgumentError,
            "No countries matched '#{@id}', please try again.",
            caller
        else
          @id = @matching[0][0]
        end
      end
      @id
    end
    private_class_method :ensure_id

    def self.normalize_id(id)
      id.gsub!(/[ -]/, "_")
      id.downcase!
      id
    end
    private_class_method :normalize_id
  end
end
