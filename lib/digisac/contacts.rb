# frozen_string_literal: true

# Contacts actions
class Digisac
  def search_contacts_by_number(number, params = {})
    number_last_chars = number.chars.last(8).join
    params.merge!({ 'where[data.number][$iLike]': "%#{number_last_chars}%" })

    get_request("/v1/contacts", params)
  end
end
