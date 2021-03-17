# frozen_string_literal: true

class Digisac
  def search_contacts_by_number(number)
    number_last_chars = number.chars.last(8).join
    get_request("/v1/contacts", { 'where[data.number][$iLike]': "%#{number_last_chars}%" })
  end
end
