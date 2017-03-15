# UseragentApi

[![Build Status](https://travis-ci.org/feedforce/useragent_api.svg?branch=master)][travisci]

[travisci]: https://travis-ci.org/feedforce/useragent_api

This gem provides an access to [UseragentAPI](https://useragentapi.com).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'useragent_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install useragent_api

## Usage

1. Instantiate an instance of {UseragentApi::Client} with a valid API key.

    ```ruby
    client = UseragentApi::Client.new(API_KEY)
    ```

2. Parse an user agent.

    ```ruby
    result = client.parse('an user agent')
    ```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/masutaka/useragent_api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

