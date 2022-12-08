require "helper"

describe WorldBank::ParamQuery do
  context "lending types" do
    it "accepts a single LendingType as param" do
      stub_get("countries/all?format=json&lendingTypes=IDB")
      lending_type = WorldBank::LendingType.new({"id" => "IDB", "value" => "Blend"})
      WorldBank::Country.all.raw.lending_type(lending_type).fetch
      expect(a_get("countries/all?format=json&lendingTypes=IDB")).to have_been_made
    end
  end
  context "income levels" do
    it "accepts a single IncomeLevels as param" do
      stub_get("countries/all?format=json&incomeLevels=LMC")
      WorldBank::Country.all.raw.income_level("LMC").fetch
      expect(a_get("countries/all?format=json&incomeLevels=LMC")).to have_been_made
    end
  end
  context "sources" do
    it "accepts a single Source as param" do
      stub_get("countries/all?format=json&sources=1")
      WorldBank::Country.all.raw.source(1).fetch
      expect(a_get("countries/all?format=json&sources=1")).to have_been_made
    end
  end
  context "featured_indicators" do
    it "adds featured param with value of 1" do
      stub_get("indicators/all?format=json&featured=1")
      WorldBank::Indicator.featured.raw.fetch
      expect(a_get("indicators/all?format=json&featured=1")).to have_been_made
    end
  end
  context "country" do
    it "adds countries to the params if given ISO-2 code" do
      stub_get("indicators/AB.LND.ARBL.ZS?format=json&countries=br")
      WorldBank::Indicator.find("AB.LND.ARBL.ZS").country("br").raw.fetch
      expect(a_get("indicators/AB.LND.ARBL.ZS?format=json&countries=br")).to have_been_made
    end
    it "adds countries to the params if given human name" do
      stub_get("indicators/AB.LND.ARBL.ZS?format=json&countries=BR")
      WorldBank::Indicator.find("AB.LND.ARBL.ZS").country("brazil").raw.fetch
      expect(a_get("indicators/AB.LND.ARBL.ZS?format=json&countries=BR")).to have_been_made
    end
  end
end
