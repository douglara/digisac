# frozen_string_literal: true

# Contacts actions
class Digisac
  def search_contacts_by_number(number, params = {})
    number_last_chars = number.chars.last(8).join
    params.merge!({ 'where[data.number][$iLike]': "%#{number_last_chars}%" })

    get_request("/v1/contacts", params)
  end

  def create_contact(number, service_id, params = {})
    params.merge!({ 'number': "55#{number}", 'serviceId': service_id })
    params.merge!({ 'internalName': number }) unless params.key?(:internalName)

    request = post_request("/v1/contacts", params)

    if request.key?(:ok) && request[:ok]["data"]["valid"] != false
      { ok: request[:ok] }
    else
      { error: request[:ok] }
    end
  end
end