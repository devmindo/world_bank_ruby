require "helper"

describe WorldBank::Indicator do
  context "find" do
    it "returns a WorldBank::Indicator" do
      stub_get("indicators/AG.AGR.TRAC.NO?format=json")
        .to_return(status: 200, headers: {"Content-Type" => "application/json"}, body: fixture("indicators_tractors.json"))
      tractors = WorldBank::Indicator.find("AG.AGR.TRAC.NO").fetch
      expect(a_get("indicators/AG.AGR.TRAC.NO?format=json")).to have_been_made
      expect(tractors).to be_a WorldBank::Indicator
    end
    context "returned Indicator has" do
      before do
        stub_get("indicators/AG.AGR.TRAC.NO?format=json")
          .to_return(status: 200, headers: {"Content-Type" => "application/json"}, body: fixture("indicators_tractors.json"))
        @tractors = WorldBank::Indicator.find("AG.AGR.TRAC.NO").fetch
      end
      it "an id" do
        expect(@tractors.id).to eql "AG.AGR.TRAC.NO"
      end
      it "a name" do
        expect(@tractors.name).to eql "Agricultural machinery, tractors"
      end
      it "a source" do
        expect(@tractors.source).to be_a WorldBank::Source
      end
      it "a note" do
        expect(@tractors.note[0..19]).to eql "Agricultural machine"
      end
      it "an organization" do
        expect(@tractors.organization).to eql "Food and Agriculture Organization, electronic files and web site."
      end
      it "many topics" do
        expect(@tractors.topics[0]).to be_a WorldBank::Topic
      end
    end
  end
end
