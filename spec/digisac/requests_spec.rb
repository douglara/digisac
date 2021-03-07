# frozen_string_literal: true

RSpec.describe Digisac do
  subject {
    Digisac.new({access_token: ENV['ACCESS_TOKEN'], endpoint_url: ENV['ENDPOINT_URL']})
  }

  describe '#get_request', :vcr do
    context 'not authorized' do
      subject {
        Digisac.new({access_token: '123', endpoint_url: ENV['ENDPOINT_URL']})
      }
      it do
        expect(subject.get_request('/v1/contacts/9c0007c1-83a5-4d1d-a96e-ee164b1b8f62')).to include(:error)            
      end
    end

    it 'success' do
      expect(subject.get_request('/v1/contacts/9c0007c1-83a5-4d1d-a96e-ee164b1b8f62')).to include(:ok)          
    end
  end
end
