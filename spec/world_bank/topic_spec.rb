require "helper"

describe WorldBank::Topic do
  context "find" do
    it "returns an instance of Topic" do
      stub_get("topics/6?format=json")
        .to_return(status: 200, headers: {"Content-Type" => "application/json"}, body: fixture("topic_6.json"))
      @environment = WorldBank::Topic.find(6).fetch
      expect(a_get("topics/6?format=json")).to have_been_made
      expect(@environment).to be_a WorldBank::Topic
    end

    context "returned topic has" do
      before do
        stub_get("topics/6?format=json")
          .to_return(status: 200, headers: {"Content-Type" => "application/json"}, body: fixture("topic_6.json"))
        @environment = WorldBank::Topic.find(6).fetch
      end
      it "name" do
        expect(@environment.name).to eql "Environment"
      end

      it "id" do
        expect(@environment.id).to eql "6"
      end

      it "note" do
        expect(@environment.note[0..20]).to eql "Natural and man-made "
      end
    end
  end
end
