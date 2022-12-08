require "helper"

describe WorldBank::LendingType do
  context "find" do
    it "returns a LendingType" do
      stub_get("lendingTypes/idb?format=json")
        .to_return(status: 200, headers: {"Content-Type" => "application/json"}, body: fixture("lending_type_idb.json"))
      @blend = WorldBank::LendingType.find("idb").fetch
      expect(a_get("lendingTypes/idb?format=json")).to have_been_made
      expect(@blend).to be_a WorldBank::LendingType
    end
    context "returned LendingType has" do
      before do
        stub_get("lendingTypes/idb?format=json")
          .to_return(status: 200, headers: {"Content-Type" => "application/json"}, body: fixture("lending_type_idb.json"))
        @blend = WorldBank::LendingType.find("idb").fetch
      end
      it "an id" do
        expect(@blend.id).to eql "IDB"
      end
      it "a name" do
        expect(@blend.name).to eql "Blend"
      end
    end
  end
end
