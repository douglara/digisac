# frozen_string_literal: true

require_relative "digisac/version"
require_relative "digisac/requests"

class Digisac
  def initialize(args={})
    @endpoint_url = args[:endpoint_url]
    @access_token = args[:access_token]
    raise InvalidParameters if @endpoint_url.nil? || @access_token.nil?

    args.key?(:retry_timeouts_delay) ? @retry_timeouts_delay = args[:retry_timeouts_delay] : @retry_timeouts_delay = 15
    args.key?(:retry_timeouts_limit) ? @retry_timeouts_limit = args[:retry_timeouts_limit] : @retry_timeouts_limit = 5
    args.key?(:retry_timeouts) ? @retry_timeouts = args[:retry_timeouts] : @retry_timeouts = true
  end
end
