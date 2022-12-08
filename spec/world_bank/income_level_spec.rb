require "helper"

describe WorldBank::IncomeLevel do
  context "find" do
    it "returns a WorldBank::IncomeLevel" do
      stub_get("incomeLevels/lmc?format=json")
        .to_return(status: 200, headers: {"Content-Type" => "application/json"}, body: fixture("income_level_lmc.json"))
      @working_class = WorldBank::IncomeLevel.find("lmc").fetch
      expect(a_get("incomeLevels/lmc?format=json")).to have_been_made
      expect(@working_class).to be_a WorldBank::IncomeLevel
    end
    context "returned IncomeLevel has" do
      before do
        stub_get("incomeLevels/lmc?format=json")
          .to_return(status: 200, headers: {"Content-Type" => "application/json"}, body: fixture("income_level_lmc.json"))
        @working_class = WorldBank::IncomeLevel.find("lmc").fetch
      end
      it "an id" do
        expect(@working_class.id).to eql "LMC"
      end
      it "a name" do
        expect(@working_class.name).to eql "Lower middle income"
      end
    end
  end
end
