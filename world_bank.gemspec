require File.expand_path("../lib/world_bank/version", __FILE__)

Gem::Specification.new do |gem|
  gem.name = "world_bank"
  gem.version = WorldBank::VERSION
  gem.authors = ["Code for America - DevTools", "Justin Stoller"]
  gem.email = ["info@codeforamerica.org", "justin.stoller@gmail.com"]
  gem.homepage = "https://github.com/codeforamerica/world_bank_ruby"
  gem.summary = "A Ruby wrapper around the World Bank's Development Indicators API"
  gem.description = "A Ruby wrapper around the World Bank's Development Indicators API"

  gem.files = `git ls-files`.split("\n")
  gem.executables = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  gem.require_paths = ["lib"]

  gem.add_dependency "faraday", ">= 2.0"
  gem.add_dependency "faraday-decode_xml"
  gem.add_dependency "faraday-mashify"
end
