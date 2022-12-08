$:.unshift File.expand_path("..", __FILE__)
$:.unshift File.expand_path("../../lib", __FILE__)
require "simplecov"
SimpleCov.start
require "world_bank"
require "rspec"
require "webmock/rspec"

def a_delete(path)
  a_request(:delete, "https://api.worldbank.org/v2/" + path)
end

def a_get(path)
  a_request(:get, "https://api.worldbank.org/v2/" + path)
end

def a_post(path)
  a_request(:post, "https://api.worldbank.org/v2/" + path)
end

def a_put(path)
  a_request(:put, "https://api.worldbank.org/v2/" + path)
end

def stub_delete(path)
  stub_request(:delete, "https://api.worldbank.org/v2/" + path)
end

def stub_get(path)
  stub_request(:get, "https://api.worldbank.org/v2/" + path)
end

def stub_post(path)
  stub_request(:post, "https://api.worldbank.org/v2/" + path)
end

def stub_put(path)
  stub_request(:put, "https://api.worldbank.org/v2/" + path)
end

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.new(fixture_path + "/" + file)
end
