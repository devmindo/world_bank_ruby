require "helper"

describe WorldBank::Client do
  context "get" do
    it "returns the response from the specified path" do
      stub_get("sources/all?format=json")
        .to_return(status: 200, body: fixture("sources.json"))
      client = WorldBank::Client.new({dirs: ["sources", "all"],
                                        params: {format: "json"}}, false)
      client.get("sources/all?format=json")
      expect(a_get("sources/all?format=json")).to have_been_made
    end
  end
end
