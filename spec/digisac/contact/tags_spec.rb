
RSpec.describe Digisac do
  subject do
    Digisac.new({ access_token: ENV["ACCESS_TOKEN"], endpoint_url: ENV["ENDPOINT_URL"] })
  end

  describe "update_tag_ids", :vcr do
    it "valid contact" do
      expect(subject.update_tag_ids("dfa57336-0308-4e4b-b3e2-369414f6c2b4", ['7a180bcb-3b02-4f8c-8ea3-61e7325a4327'])).to include(:ok)
    end
  end
end