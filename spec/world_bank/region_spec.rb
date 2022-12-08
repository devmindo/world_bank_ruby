require "helper"

describe WorldBank::Region do
  context "find" do
    it "returns WorldBank::Region" do
      stub_get("regions/wld?format=json")
        .to_return(status: 200, headers: {"Content-Type" => "application/json"}, body: fixture("regions_world.json"))
      @so_helpful = WorldBank::Region.find("wld").fetch
      expect(a_get("regions/wld?format=json")).to have_been_made
      expect(@so_helpful).to be_a WorldBank::Region
    end
    context "returned Region has" do
      before do
        stub_get("regions/wld?format=json")
          .to_return(status: 200, headers: {"Content-Type" => "application/json"}, body: fixture("regions_world.json"))
        @so_helpful = WorldBank::Region.find("wld").fetch
      end
      it "an id" do
        expect(@so_helpful.id).to eql ""
      end
      it "a code" do
        expect(@so_helpful.code).to eql "WLD"
      end
      it "a name" do
        expect(@so_helpful.name).to eql "World"
      end
    end
  end
end
