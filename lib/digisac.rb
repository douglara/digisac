# frozen_string_literal: true

require_relative "digisac/version"
require_relative "digisac/requests"
require_relative "digisac/contacts"
require_relative "digisac/messages"

# Wrapper Digisac API
class Digisac
  def initialize(args = {})
    @endpoint_url = args[:endpoint_url]
    @access_token = args[:access_token]
    raise InvalidParameters if @endpoint_url.nil? || @access_token.nil?

    @retry_timeouts_delay = args.key?(:retry_timeouts_delay) ? args[:retry_timeouts_delay] : 15
    @retry_timeouts_limit = args.key?(:retry_timeouts_limit) ? args[:retry_timeouts_limit] : 5
    @retry_timeouts = args.key?(:retry_timeouts) ? args[:retry_timeouts] : true
  end
end
