require "helper"

describe WorldBank::Source do
  context "find" do
    it "returns a new Source object" do
      stub_get("sources/15?format=json")
        .to_return(status: 200, headers: {"Content-Type" => "application/json"}, body: fixture("source_15.json"))
      @gem = WorldBank::Source.find(15).fetch
      expect(a_get("sources/15?format=json")).to have_been_made
      expect(@gem).to be_a WorldBank::Source
    end
    context "returned Source has" do
      before do
        stub_get("sources/15?format=json")
          .to_return(status: 200, headers: {"Content-Type" => "application/json"}, body: fixture("source_15.json"))
        @gem = WorldBank::Source.find(15).fetch
      end
      it "an id" do
        expect(@gem.id).to eql "15"
      end
      it "a name" do
        expect(@gem.name).to eql "Global Economic Monitor"
      end
      it "a description" do
        expect(@gem.description).to eql ""
      end
      it "a url" do
        expect(@gem.url).to eql ""
      end
    end
  end
end
