# Digisac

This Gem is basic http wrapper from Digisac API

Original documentation: http://digisac-docs.s3-website-us-west-1.amazonaws.com/

# Requirements

- You need Digisac service
- Generate API Access Token
- API URL, usually: `https://BUSINESS_NAME-api.digisac.com.br`

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'digisac'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install digisac

## Usage

First need to instance the client:
```ruby
api = Digisac.new({ access_token: "YOU_ACCESS_TOKEN", endpoint_url: "YOU_API_ENDPOINT" })
```

## Methods

##### Generics


    * api.get_request("/API_PATH", params={}, headers={})
      -> Make get request.
      -> Example: api.get_request("/v1/messages", {'where[contactId]': '1234'})

    * api.post_request("/API_PATH", params={}, headers={})
      -> Make post request.

    * api.put_request("/API_PATH", params={}, headers={})
      -> Make put request.

    * api.patch_request("/API_PATH", params={}, headers={})
      -> Make patch request.

    * api.head_request("/API_PATH", params={}, headers={})
      -> Make head request.

    * api.delete_request("/API_PATH", params={}, headers={})
      -> Make delete request.


##### Messages

    * api.send_message_to_contact_id("CONTACT_ID", "MESSAGE")
      -> Send contact message
    * api.send_message_to_contact_id("CONTACT_ID", "MESSAGE", {'file_url': 'https://miro.medium.com/proxy/1*sZSVVtdP9TE3mUoGh4GoYA.png'})
      -> Send contact message with file

    * api.get_contact_messages("CONTACT_ID")
      -> Get last messages the contact


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/digisac. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/digisac/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Digisac project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/digisac/blob/master/CODE_OF_CONDUCT.md).
