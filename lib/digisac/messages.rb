# frozen_string_literal: true
require 'base64'
require 'open-uri'
require 'mimemagic'

# Send messages
class Digisac
  def send_message_to_contact_id(contact_id, text, params = nil)
    body_params = {
      'contactId': contact_id,
      'text': text
    }

    unless params.nil?
      if params.key?(:file_url)
        params[:file] = file_url_encode(params[:file_url])
        params.delete(:file_url)
      end

      body_params.merge!(params) 
    end

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

  def file_url_encode(file_url)
    data = URI.open(file_url).read
    {'base64': Base64.strict_encode64(data), "mimetype": MimeMagic.by_magic(data).type, "name": "file_name"}
  end
end
