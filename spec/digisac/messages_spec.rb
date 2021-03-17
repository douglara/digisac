# frozen_string_literal: true

RSpec.describe Digisac do
  subject do
    Digisac.new({ access_token: ENV["ACCESS_TOKEN"], endpoint_url: ENV["ENDPOINT_URL"] })
  end

  describe "#send_message_to_contact_id", :vcr do
    it "success" do
      expect(subject.send_message_to_contact_id("9c0007c1-83a5-4d1d-a96e-ee164b1b8f62", "Hello")).to include(:ok)
    end

    it "should sent with params" do
      expect(subject.send_message_to_contact_id("9c0007c1-83a5-4d1d-a96e-ee164b1b8f62", "Hello",
                                                { 'dontOpenTicket': true })).to include(:ok)
    end

    it "error" do
      expect(subject.send_message_to_contact_id("f8d0e7af-cbca-4353-8610-bb4f9dee7f66", "Hello")).to include(:error)
    end
  end
end
