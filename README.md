# Macquarie Leasing PARTNER API


## Installation

Add this line to your application's Gemfile:

    gem 'maclease'

And then execute:

    $ bundle

Then run install generator:

	rails g maclease:install


## Usage

### Request

    request = Maclease::Origination.new().get_quote(...)
    request = Maclease::Origination.new().create_application(...)

You need to have a consumer_key, consumer_secret and api_key configured.


## Contributing

1. Fork it ( http://github.com/easylodge/maclease/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. See dev.rb file in root
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request
