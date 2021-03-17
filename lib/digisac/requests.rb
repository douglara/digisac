# frozen_string_literal: true

require "faraday"

# Make HTTP Requests
class Digisac
  def get_request(action, params = {}, headers = {})
    headers = make_headers(headers)

    make_request do
      Faraday.get "#{@endpoint_url}#{action}", params, headers
    end
  end

  def post_request(action, params = {}, headers = {})
    headers = make_headers(headers)

    make_request do
      Faraday.post "#{@endpoint_url}#{action}", params.to_json, headers
    end
  end

  def put_request(action, params = {}, headers = {})
    headers = make_headers(headers)

    make_request do
      return Faraday.put "#{@endpoint_url}#{action}", params.to_json, headers
    end
  end

  def path_request(action, params = {}, headers = {})
    headers = make_headers(headers)

    make_request do
      Faraday.patch "#{@endpoint_url}#{action}", params.to_json, headers
    end
  end

  def delete_request(action, params = {}, headers = {})
    headers = make_headers(headers)

    make_request do
      Faraday.delete "#{@endpoint_url}#{action}", params.to_json, headers
    end
  end

  private

  def make_request
    retries ||= 0
    request = yield
    return { error: parse_body(request), request: request } if request.status == 401
    return { error: parse_body(request), request: request } if request.status == 400

    { ok: parse_body(request), request: request }
  rescue StandardError => e
    if @retry_timeouts == true && e.response.code != 401
      sleep(@retry_timeouts_delay)
      retry if (retries += 1) < @retry_timeouts_limit
    end
    { error: e }
  end

  def parse_body(request)
    JSON.parse(request.body)
  rescue StandardError
    request.body
  end

  def make_headers(headers)
    headers.merge({ 'Authorization': "Bearer #{@access_token}", 'Content-Type': "application/json" })
  end
end
