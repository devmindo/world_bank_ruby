require "helper"

describe WorldBank::Country do
  context "returned Country has" do
    before do
      stub_get("countries/in?format=json")
        .to_return(status: 200, headers: {"Content-Type" => "application/json"}, body: fixture("countries_india.json"))
      @india = WorldBank::Country.find("in").fetch
    end
    it "a three letter code" do
      expect(@india.iso3_code).to eql "IND"
    end
    it "a two letter code" do
      expect(@india.iso2_code).to eql "IN"
    end
    it "a name" do
      expect(@india.name).to eql "India"
    end
    it "an IncomeLevel" do
      expect(@india.income_level).to be_a WorldBank::IncomeLevel
    end
    it "a LendingType" do
      expect(@india.lending_type).to be_a WorldBank::LendingType
    end
    it "a capital" do
      expect(@india.capital).to eql "New Delhi"
    end
    it "a region" do
      expect(@india.region).to be_a WorldBank::Region
    end
  end
end
