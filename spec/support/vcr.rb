# frozen_string_literal: true

require "vcr"

VCR.configure do |config|
  config.allow_http_connections_when_no_cassette = false
  config.cassette_library_dir = File.expand_path("../cassettes", __dir__)
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.filter_sensitive_data("<ENDPOINT_URL>") { ENV["ENDPOINT_URL"] }
  config.filter_sensitive_data("<ACCESS_TOKEN>") { ENV["ACCESS_TOKEN"] }
  config.filter_sensitive_data("<TEST_NUMBER>") { ENV["TEST_NUMBER"] }
end
