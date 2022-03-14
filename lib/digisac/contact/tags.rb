class Digisac
  def update_tag_ids(contact_id, tag_ids)
    request = put_request("/v1/contacts/#{contact_id}", { 'tagIds': tag_ids })
    
    if request.key?(:ok)
      { ok: request[:ok] }
    else
      { error: request[:ok] }
    end
  end
end