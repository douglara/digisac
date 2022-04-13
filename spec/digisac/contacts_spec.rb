# frozen_string_literal: true

RSpec.describe Digisac do
  subject do
    Digisac.new({ access_token: ENV["ACCESS_TOKEN"], endpoint_url: ENV["ENDPOINT_URL"] })
  end

  describe "#search_contacts_by_number", vcr: { match_requests_on: [:method] } do
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

  describe "create_contact", :vcr do
    context "valid contact" do
      it "with 9 digits" do
        expect(subject.create_contact("41996910256", "df91e9f9-1313-49fa-95ca-daa4061e604e")).to include(:ok)
      end
      it "with 8 digits" do
        expect(subject.create_contact("4196910256", "df91e9f9-1313-49fa-95ca-daa4061e604e")).to include(:ok)
      end

      it "with params" do
        expect(subject.create_contact("41996910256", "df91e9f9-1313-49fa-95ca-daa4061e604e",
                                      { 'internalName': "Test" })).to include(:ok)
      end
    end

    it "invalid contact" do
      expect(subject.create_contact("99999999999", "df91e9f9-1313-49fa-95ca-daa4061e604e")).to include(:ok)
    end
  end

  describe "delete_contact", :vcr do
    it "valid contact" do
      expect(subject.delete_contact("31e1d224-45c9-4e83-b171-915d203dd34c")).to include(:ok)
    end
  end
end
