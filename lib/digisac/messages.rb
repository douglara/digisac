# frozen_string_literal: true

# Send messages
class Digisac
  def send_message_to_contact_id(contact_id, text, params = nil)
    body_params = {
      'contactId': contact_id,
      'text': text
    }

    body_params.merge!(params) unless params.nil?

    post_request("/v1/messages", body_params)
  end
end
