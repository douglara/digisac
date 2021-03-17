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

  def get_contact_messages(contact_id, params = nil)
    url_params = {
      'where[contactId]': contact_id,
      'where[visible]': true,
      'limit': 20,
      'order[0][0]': "timestamp",
      'order[0][1]': "DESC"
    }
    url_params.merge!(params) unless params.nil?

    get_request("/v1/messages", url_params)
  end
end
