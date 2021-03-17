# frozen_string_literal: true

RSpec.describe Digisac do
  it "has a version number" do
    expect(Digisac::VERSION).not_to be nil
  end

  describe "#initialize" do
    it "success" do
      api = Digisac.new({ access_token: "321", endpoint_url: "https://teste.digisac.app" })
      expect(api.instance_variable_get(:@access_token)).to eq("321")
      expect(api.instance_variable_get(:@endpoint_url)).to eq("https://teste.digisac.app")
    end

    it "error" do
      expect { Digisac.new }.to raise_error(/InvalidParameters/)
    end
  end
end
