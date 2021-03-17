# frozen_string_literal: true

RSpec.describe Digisac do
  subject do
    Digisac.new({ access_token: ENV["ACCESS_TOKEN"], endpoint_url: ENV["ENDPOINT_URL"] })
  end

  describe "#search_contacts_by_number", :vcr do
    it "success" do
      expect(subject.search_contacts_by_number(ENV["TEST_NUMBER"])).to include(:ok)
    end

    it "success with custom params" do
      request = subject.search_contacts_by_number(ENV["TEST_NUMBER"], { 'include[0]': "service", 'include[1]': "tags" })
      expect(request).to include(:ok)
      expect(request[:ok]["data"][0]).to include("service")
      expect(request[:ok]["data"][0]).to include("tags")
    end
  end
end
